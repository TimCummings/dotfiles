require('plugins')
require('impatient').enable_profile()
require('highlights')
require('mappings')
require('settings')
require('tabline')

-- call plugins inside protected call in case they're not installed
if pcall(function()
    -- require('onedark').setup()
    require('colorizer').setup()
    require('statusline')
    require('nvim-tree').setup()
    require('lsp')
    require('treesitter_config').setup()
  end) then
else
  print('One or more plugins missing. Run `:PackerInstall`!')
end
