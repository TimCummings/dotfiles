-- nvim-tree recommends disabling netrw ASAP to avoid race conditions
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('highlights')
require('mappings')
require('settings')
require('tabline')
require('statusline')
