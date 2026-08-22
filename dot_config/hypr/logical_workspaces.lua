local M = {}

local Policy = {}
M.policy = Policy

local MAX_WORKSPACE_ID = 2147483647
local TEMP_ID_START = MAX_WORKSPACE_ID - 1024

local function is_positive_integer(value)
  return type(value) == "number" and value > 0 and value == math.floor(value)
end

function Policy.encode(row, slot, monitor_count)
  assert(is_positive_integer(row), "row must be a positive integer")
  assert(is_positive_integer(slot), "slot must be a positive integer")
  assert(is_positive_integer(monitor_count), "monitor_count must be a positive integer")
  assert(slot <= monitor_count, "slot must not exceed monitor_count")
  return (row - 1) * monitor_count + slot
end

function Policy.decode(workspace_id, monitor_count)
  assert(is_positive_integer(workspace_id), "workspace_id must be a positive integer")
  assert(is_positive_integer(monitor_count), "monitor_count must be a positive integer")
  local zero_based = workspace_id - 1
  return math.floor(zero_based / monitor_count) + 1, (zero_based % monitor_count) + 1
end

function Policy.next_row(occupied_count, current_row)
  if occupied_count == 0 then
    return 1
  end
  if current_row > occupied_count then
    return 1
  end
  return current_row + 1
end

function Policy.previous_row(occupied_count, current_row)
  if occupied_count == 0 then
    return 1
  end
  if current_row > occupied_count then
    return occupied_count
  end
  if current_row <= 1 then
    return occupied_count + 1
  end
  return current_row - 1
end

function Policy.compaction(records, current_row)
  local row_state = {}
  for _, record in ipairs(records) do
    local state = row_state[record.row]
    if state == nil then
      state = { windows = 0, active = false }
      row_state[record.row] = state
    end
    state.windows = state.windows + (record.windows or 0)
    state.active = state.active or record.active == true
  end

  local occupied_rows = {}
  for row, state in pairs(row_state) do
    if state.windows > 0 then
      table.insert(occupied_rows, row)
    end
  end
  table.sort(occupied_rows)

  local row_map = {}
  for index, row in ipairs(occupied_rows) do
    row_map[row] = index
  end

  local occupied_count = #occupied_rows
  local new_current_row = row_map[current_row]
  if new_current_row == nil then
    new_current_row = occupied_count + 1
    row_map[current_row] = new_current_row
  end

  return {
    occupied_count = occupied_count,
    current_row = new_current_row,
    row_map = row_map,
  }
end

function Policy.sorted_monitor_names(monitors)
  local sorted = {}
  for _, monitor in ipairs(monitors) do
    if not monitor.is_mirror then
      table.insert(sorted, {
        name = monitor.name,
        x = monitor.x or (monitor.position and monitor.position.x) or 0,
        y = monitor.y or (monitor.position and monitor.position.y) or 0,
      })
    end
  end
  table.sort(sorted, function(left, right)
    if left.x ~= right.x then
      return left.x < right.x
    end
    if left.y ~= right.y then
      return left.y < right.y
    end
    return left.name < right.name
  end)
  return sorted
end

local function log(message)
  print("[logical-workspaces] " .. message)
end

local function notify_error(message)
  log("ERROR: " .. message)
  if hl.notification and hl.notification.create then
    hl.notification.create({
      text = "Logical workspaces: " .. message,
      timeout = 8000,
      icon = "error",
    })
  end
end

function M.setup(options)
  options = options or {}

  local state = {
    topology = {},
    current_row = 1,
    reconciling = false,
    internal_depth = 0,
    disabled = false,
    timer = nil,
    pending_snapshot = nil,
    pending_command = nil,
    debounce_ms = options.debounce_ms or 40,
  }

  local manager = {}

  local function with_internal(callback)
    state.internal_depth = state.internal_depth + 1
    local ok, result = pcall(callback)
    state.internal_depth = state.internal_depth - 1
    if not ok then
      error(result)
    end
    return result
  end

  local function live_monitors()
    local by_name = {}
    local raw = {}
    for _, monitor in ipairs(hl.get_monitors()) do
      if not monitor.is_mirror then
        table.insert(raw, monitor)
        by_name[monitor.name] = monitor
      end
    end

    local topology = Policy.sorted_monitor_names(raw)
    for _, entry in ipairs(topology) do
      entry.object = by_name[entry.name]
    end
    return topology
  end

  local function topology_slot(topology, monitor_name)
    for slot, entry in ipairs(topology) do
      if entry.name == monitor_name then
        return slot
      end
    end
    return nil
  end

  local function workspace_records(topology)
    local records = {}
    local monitor_count = #topology
    if monitor_count == 0 then
      return records
    end

    for _, workspace in ipairs(hl.get_workspaces()) do
      if workspace.id and workspace.id > 0 and not workspace.special then
        local row, slot = Policy.decode(workspace.id, monitor_count)
        local owner = topology[slot] and topology[slot].name
        if owner == nil and workspace.monitor then
          owner = workspace.monitor.name
        end
        table.insert(records, {
          workspace = workspace,
          id = workspace.id,
          row = row,
          owner = owner,
          windows = workspace.windows or 0,
          active = workspace.active == true,
        })
      end
    end
    return records
  end

  local function focused_row(topology)
    if #topology == 0 then
      return 1
    end
    local monitor = hl.get_active_monitor()
    local workspace = monitor and monitor.active_workspace
    if workspace and workspace.id and workspace.id > 0 then
      return Policy.decode(workspace.id, #topology)
    end
    return state.current_row or 1
  end

  local function allocate_temp_ids(records, reserved)
    local used = {}
    for _, workspace in ipairs(hl.get_workspaces()) do
      if workspace.id and workspace.id > 0 then
        used[workspace.id] = true
      end
    end
    for id in pairs(reserved) do
      used[id] = true
    end

    local next_id = TEMP_ID_START
    local result = {}
    for _, record in ipairs(records) do
      while used[next_id] do
        next_id = next_id - 1
      end
      assert(next_id > 0, "ran out of temporary workspace IDs")
      result[record] = next_id
      used[next_id] = true
      next_id = next_id - 1
    end
    return result
  end

  local function change_workspace_id(workspace, id)
    hl.dispatch(hl.dsp.workspace.change_id({ workspace = workspace, id = id }))
    return workspace.id == id
  end

  local function set_rule_enabled(rule, enabled)
    if rule then
      rule:set_enabled(enabled)
    end
  end

  local function create_workspace(id, monitor)
    local existing = hl.get_workspace(tostring(id))
    if existing then
      return existing, nil
    end

    local rule = hl.workspace_rule({
      workspace = tostring(id),
      monitor = monitor.name,
      persistent = true,
    })
    hl.exec_scheduled_prop_refresh_immediately()

    local workspace = hl.get_workspace(tostring(id))
    if workspace == nil then
      set_rule_enabled(rule, false)
      hl.exec_scheduled_prop_refresh_immediately()
      error("failed to create workspace " .. id .. " on " .. monitor.name)
    end
    return workspace, rule
  end

  local function move_workspace_to_monitor(workspace, monitor)
    if workspace.monitor and workspace.monitor.name == monitor.name then
      return
    end
    hl.dispatch(hl.dsp.workspace.move({ workspace = workspace, monitor = monitor.name }))
  end

  local function switch_to_row(row)
    local topology = live_monitors()
    if #topology == 0 then
      return
    end

    local original_monitor = hl.get_active_monitor()
    local temporary_rules = {}

    with_internal(function()
      for slot, entry in ipairs(topology) do
        local id = Policy.encode(row, slot, #topology)
        local workspace, rule = create_workspace(id, entry.object)
        if rule then
          table.insert(temporary_rules, rule)
        end
        move_workspace_to_monitor(workspace, entry.object)
      end

      for slot, entry in ipairs(topology) do
        local id = Policy.encode(row, slot, #topology)
        entry.object:set_workspace({ workspace = tostring(id) })
      end

      for _, rule in ipairs(temporary_rules) do
        set_rule_enabled(rule, false)
      end
      if #temporary_rules > 0 then
        hl.exec_scheduled_prop_refresh_immediately()
      end

      local now_focused = hl.get_active_monitor()
      if original_monitor and (not now_focused or now_focused.name ~= original_monitor.name) then
        hl.dispatch(hl.dsp.focus({ monitor = original_monitor.name }))
      end
    end)

    state.current_row = row
    state.topology = topology
  end

  local function move_windows(source, target)
    if source == target or source.id == nil or target.id == nil then
      return
    end
    for _, window in ipairs(source:get_windows()) do
      hl.dispatch(hl.dsp.window.move({
        workspace = target,
        window = window,
        follow = false,
      }))
    end
  end

  local function merge_removed_owners(records, topology)
    if #topology == 0 then
      return records
    end

    local active_names = {}
    for _, entry in ipairs(topology) do
      active_names[entry.name] = true
    end

    local focused = hl.get_active_monitor()
    local destination_name = focused and active_names[focused.name] and focused.name or topology[1].name
    local destination_monitor = nil
    for _, entry in ipairs(topology) do
      if entry.name == destination_name then
        destination_monitor = entry.object
        break
      end
    end

    local temporary_rules = {}
    local next_temporary = TEMP_ID_START - 50000
    for _, record in ipairs(records) do
      if record.owner and not active_names[record.owner] and (record.workspace.windows or 0) > 0 then
        local destination = nil
        for _, candidate in ipairs(records) do
          if candidate.row == record.row and candidate.owner == destination_name then
            destination = candidate
            break
          end
        end

        if destination == nil then
          while hl.get_workspace(tostring(next_temporary)) do
            next_temporary = next_temporary - 1
          end
          local workspace, rule = create_workspace(next_temporary, destination_monitor)
          if rule then
            table.insert(temporary_rules, rule)
          end
          destination = {
            workspace = workspace,
            id = workspace.id,
            row = record.row,
            owner = destination_name,
            windows = 0,
            active = false,
          }
          table.insert(records, destination)
          next_temporary = next_temporary - 1
        end

        move_windows(record.workspace, destination.workspace)
        record.windows = record.workspace.windows or 0
        destination.windows = destination.workspace.windows or 0
      end
    end

    for _, rule in ipairs(temporary_rules) do
      set_rule_enabled(rule, false)
    end
    if #temporary_rules > 0 then
      hl.exec_scheduled_prop_refresh_immediately()
    end
    return records
  end

  local function reindex(records, topology, compact)
    local monitor_count = #topology
    local final_owner_slot = {}
    for slot, entry in ipairs(topology) do
      final_owner_slot[entry.name] = slot
    end

    local final_for_record = {}
    local primary_for_final = {}
    local retired = {}
    local reserved = {}

    for _, record in ipairs(records) do
      local new_row = compact.row_map[record.row]
      local slot = record.owner and final_owner_slot[record.owner]
      if new_row and slot then
        local final_id = Policy.encode(new_row, slot, monitor_count)
        local primary = primary_for_final[final_id]
        if primary == nil then
          primary_for_final[final_id] = record
          final_for_record[record] = final_id
          reserved[final_id] = true
        else
          move_windows(record.workspace, primary.workspace)
          table.insert(retired, record)
        end
      else
        table.insert(retired, record)
      end
    end

    local changing = {}
    for record, final_id in pairs(final_for_record) do
      if record.workspace.id ~= final_id then
        table.insert(changing, record)
      end
    end
    for _, record in ipairs(retired) do
      if record.workspace and record.workspace.id and reserved[record.workspace.id] then
        table.insert(changing, record)
      end
    end

    if #changing == 0 then
      return
    end

    local temporary_ids = allocate_temp_ids(changing, reserved)
    local original_ids = {}
    for _, record in ipairs(changing) do
      if record.workspace.id == nil then
        goto continue_staging
      end
      original_ids[record] = record.workspace.id
      if not change_workspace_id(record.workspace, temporary_ids[record]) then
        error("failed to stage workspace " .. original_ids[record])
      end
      ::continue_staging::
    end

    for record, final_id in pairs(final_for_record) do
      if temporary_ids[record] and not change_workspace_id(record.workspace, final_id) then
        for rollback_record, original_id in pairs(original_ids) do
          if rollback_record.workspace.id ~= original_id then
            change_workspace_id(rollback_record.workspace, original_id)
          end
        end
        error("failed to assign final workspace ID " .. final_id)
      end
    end
  end

  local function normalize(records)
    if state.disabled then
      return nil
    end
    if state.reconciling then
      return nil
    end

    local topology = live_monitors()
    if #topology == 0 then
      state.topology = topology
      return 0
    end

    state.reconciling = true
    local ok, result = pcall(function()
      return with_internal(function()
        local record_topology = state.topology
        if #record_topology == 0 then
          record_topology = topology
          state.current_row = focused_row(topology)
        end
        records = records or workspace_records(record_topology)
        records = merge_removed_owners(records, topology)
        local compact = Policy.compaction(records, state.current_row)
        reindex(records, topology, compact)
        state.current_row = compact.current_row
        state.topology = topology
        switch_to_row(state.current_row)
        return compact.occupied_count
      end)
    end)
    state.reconciling = false

    if not ok then
      state.disabled = true
      notify_error(result)
      return nil
    end

    local pending = state.pending_command
    state.pending_command = nil
    if pending then
      pending()
    end
    return result
  end

  local function schedule_normalize(snapshot)
    if state.disabled or state.internal_depth > 0 then
      return
    end
    if snapshot and state.pending_snapshot == nil then
      state.pending_snapshot = snapshot
    end
    if state.timer then
      state.timer:set_enabled(false)
    end
    state.timer = hl.timer(function()
      local records = state.pending_snapshot
      state.pending_snapshot = nil
      normalize(records)
    end, { timeout = state.debounce_ms, type = "oneshot" })
  end

  local function run_or_queue(callback)
    if state.disabled then
      return
    end
    if state.reconciling then
      state.pending_command = callback
      return
    end
    callback()
  end

  function manager.next()
    run_or_queue(function()
      local occupied = normalize()
      if occupied ~= nil then
        switch_to_row(Policy.next_row(occupied, state.current_row))
      end
    end)
  end

  function manager.previous()
    run_or_queue(function()
      local occupied = normalize()
      if occupied ~= nil then
        switch_to_row(Policy.previous_row(occupied, state.current_row))
      end
    end)
  end

  function manager.focus(row)
    run_or_queue(function()
      local occupied = normalize()
      if occupied ~= nil and is_positive_integer(row) and row <= occupied + 1 then
        switch_to_row(row)
      end
    end)
  end

  local function move_to_row(row)
    local occupied = normalize()
    if occupied == nil or not is_positive_integer(row) or row > occupied + 1 then
      return
    end

    local window = hl.get_active_window()
    local monitor = hl.get_active_monitor()
    local topology = live_monitors()
    if window == nil or monitor == nil or window.workspace == nil or window.workspace.special then
      return
    end

    local slot = topology_slot(topology, monitor.name)
    if slot == nil then
      return
    end

    local id = Policy.encode(row, slot, #topology)
    local destination, rule = create_workspace(id, monitor)
    with_internal(function()
      hl.dispatch(hl.dsp.window.move({ workspace = destination, window = window, follow = false }))
      switch_to_row(row)
      hl.dispatch(hl.dsp.focus({ window = window }))
    end)
    set_rule_enabled(rule, false)
    if rule then
      hl.exec_scheduled_prop_refresh_immediately()
    end
    schedule_normalize()
  end

  function manager.move_next()
    run_or_queue(function()
      local occupied = normalize()
      if occupied ~= nil then
        move_to_row(Policy.next_row(occupied, state.current_row))
      end
    end)
  end

  function manager.move_previous()
    run_or_queue(function()
      local occupied = normalize()
      if occupied ~= nil then
        move_to_row(Policy.previous_row(occupied, state.current_row))
      end
    end)
  end

  function manager.move_to(row)
    run_or_queue(function()
      move_to_row(row)
    end)
  end

  function manager.reconcile()
    run_or_queue(function()
      normalize()
    end)
  end

  local function subscribe(event, callback)
    -- Hyprland owns the callback registration for the lifetime of this Lua
    -- config state; the returned handle is only needed for early removal.
    hl.on(event, callback)
  end

  subscribe("window.open", function()
    schedule_normalize()
  end)
  subscribe("window.close", function()
    schedule_normalize()
  end)
  subscribe("window.move_to_workspace", function()
    schedule_normalize()
  end)
  subscribe("workspace.removed", function()
    schedule_normalize()
  end)
  subscribe("workspace.active", function(workspace)
    if state.internal_depth > 0 or state.reconciling or not workspace or workspace.special or workspace.id <= 0 then
      return
    end
    local topology = live_monitors()
    if #topology == 0 then
      return
    end
    local row = Policy.decode(workspace.id, #topology)
    run_or_queue(function()
      state.current_row = row
      switch_to_row(row)
      schedule_normalize()
    end)
  end)

  local function topology_changed()
    local snapshot = state.pending_snapshot or workspace_records(state.topology)
    schedule_normalize(snapshot)
  end
  subscribe("monitor.added", topology_changed)
  subscribe("monitor.removed", topology_changed)
  subscribe("monitor.layout_changed", topology_changed)
  subscribe("hyprland.start", function()
    schedule_normalize()
  end)

  -- Config verification runs before Hyprland has constructed its live monitor
  -- state. Runtime lifecycle events above perform the initial reconciliation.
  state.topology = {}
  state.current_row = 1

  manager.policy = Policy
  return manager
end

return M
