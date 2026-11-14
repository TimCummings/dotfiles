local module = assert(loadfile("dot_config/hypr/logical_workspaces.lua"))()
local policy = module.policy

local function assert_equal(actual, expected, message)
  if actual ~= expected then
    error((message or "values differ") .. ": expected " .. tostring(expected) .. ", got " .. tostring(actual))
  end
end

local function test_retain_outage_snapshot()
  local stable_snapshot = { { id = 1, owner = "DP-2" } }
  local intermediate_snapshot = { { id = 1, owner = "DP-1" } }

  assert_equal(
    policy.retain_outage_snapshot(stable_snapshot, intermediate_snapshot),
    stable_snapshot,
    "the first outage snapshot must remain authoritative"
  )
  assert_equal(
    policy.retain_outage_snapshot(nil, stable_snapshot),
    stable_snapshot,
    "the first zero-monitor reconciliation must save its snapshot"
  )
end

local function test_workspace_mapping()
  assert_equal(policy.encode(3, 2, 2), 6, "two-monitor encoding")
  local row, slot = policy.decode(6, 2)
  assert_equal(row, 3, "two-monitor row decoding")
  assert_equal(slot, 2, "two-monitor slot decoding")
end

test_retain_outage_snapshot()
test_workspace_mapping()

print("hypr logical workspace tests: ok")
