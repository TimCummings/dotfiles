local M = {}

-- gracefully handle missing plugins
function M.protected_require(plugin_name, plugin_options)
  plugin_options = plugin_options or {}
  local ok, plugin = pcall(require, plugin_name)

  if ok then
    plugin.setup(plugin_options)
  else
    print('Error requiring plugin: ' .. plugin_name)
  end
end

return M
