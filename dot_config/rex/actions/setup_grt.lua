return function(ctx, args)
  local home = assert(os.getenv("HOME"), "HOME is not set")
  local shell = "com.superlogical.terminal.shell"

  local function find_session(sessions, label)
    for _, session in ipairs(sessions) do
      if session.label == label then
        return session
      end
    end

    return nil
  end

  local result, err = rex.call("session.list")
  if err then error(err, 0) end
  local existing_sessions = result.sessions

  local label = "main"
  if find_session(existing_sessions, label) then
    print("session " .. label .. " already exists.")
  else
    local path = home .. "/code_projects/grt-bare/main"
    local result, err = rex.call("session.create", {
      label = label,
      initial_windows = {
        {
          window_label = "server",
          layout = rex.layout.horizontal(
            0.5,
            rex.layout.block { flavor = shell, options = { cwd = path } },
            rex.layout.block { flavor = shell, options = { cwd = path } }
          )
        },
        {
          window_label = "code",
          layout = rex.layout.horizontal(
            0.5,
            rex.layout.block { flavor = shell, options = { cwd = path } },
            rex.layout.block { flavor = shell, options = { cwd = path } }
          )
        },
        {
          window_label = "console",
          layout = rex.layout.horizontal(
            0.5,
            rex.layout.block { flavor = shell, options = { cwd = path } },
            rex.layout.block { flavor = shell, options = { cwd = path } }
          )
        },
      },
    })
    if err then error(err, 0) end
  end

  local label = "code review"
  if find_session(existing_sessions, label) then
    print("session " .. label .. " already exists.")
  else
    local path = home .. "/code_projects/grt-bare/code-review"
    local result, err = rex.call("session.create", {
      label = label,
      initial_windows = {
        {
          window_label = "AI",
          layout = rex.layout.horizontal(
            0.5,
            rex.layout.block { flavor = shell, options = { cwd = path } },
            rex.layout.block { flavor = shell, options = { cwd = path } }
          )
        },
      },
    })
    if err then error(err, 0) end
  end

  local label = "specs"
  if find_session(existing_sessions, label) then
    print("session " .. label .. " already exists.")
  else
    local path = home .. "/code_projects/groups-recover-together-specs"
    local result, err = rex.call("session.create", {
      label = label,
      initial_windows = {
        {
          window_label = "AI",
          layout = rex.layout.horizontal(
            0.5,
            rex.layout.block { flavor = shell, options = { cwd = path } },
            rex.layout.block { flavor = shell, options = { cwd = path } }
          )
        },
      },
    })
    if err then error(err, 0) end
  end
end
