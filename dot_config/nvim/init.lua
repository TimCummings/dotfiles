-- nvim-tree recommends disabling netrw ASAP to avoid race conditions
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')

local ok, impatient = pcall(require, 'impatient')
if ok then
  impatient.enable_profile()
else
  print('Error profiling with `impatient`!')
end

require('highlights')
require('mappings')
require('settings')
require('tabline')
require('statusline')
