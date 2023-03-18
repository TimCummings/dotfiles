-- nvim-tree recommends disabling netrw ASAP to avoid race conditions
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('highlights')

-- require('tabline')

-- bootstrap plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require('lazy').setup(plugins, opts)
require('lazy').setup('plugins', {
  ui = { border = 'rounded' },
})

require('settings')
require('mappings')
