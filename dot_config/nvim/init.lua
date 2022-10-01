-- nvim-tree recommends disabling netrw ASAP to avoid race conditions
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('impatient').enable_profile()
require('highlights')
require('mappings')
require('settings')
require('tabline')
require('statusline')

-- call plugins inside protected call in case they're not installed
if pcall(function()
    require('nvim-tree').setup()
    require('lsp')
    require('treesitter_config').setup()
    require('orgmode_config').setup()
  end) then
else
  print('One or more plugins missing. Run `:PackerInstall`!')
end
