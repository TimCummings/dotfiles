-- Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

require('settings')
require('plugins')
require('mappings')
require('tabline')

-- call plugins inside protected call in case they're not installed
if pcall(function()
    require('nord').set()
    -- require('onedark').setup()
    require('colorizer').setup()
    require('statusline')
    require('nvim-tree').setup()

    require('lsp')
    require('treesitter_config').setup()
    -- installing parsers currently locks up VPS
    -- manually install parsers one at a time for now with `:TSInstall`
    -- possible issue match: https://github.com/nvim-treesitter/nvim-treesitter/issues/1254
    -- require('treesitter_config').setup{
    --   ensure_installed = {
    --     "bash",
    --     "comment",
    --     "css",
    --     "dockerfile",
    --     "go",
    --     "gomod",
    --     "graphql",
    --     "html",
    --     "javascript",
    --     "jsdoc",
    --     "json",
    --     "lua",
    --     "python",
    --     "query",
    --     "regex",
    --     "ruby",
    --     "rust",
    --     "scss",
    --     "toml",
    --     "tsx",
    --     "typescript",
    --     "vue",
    --     "yaml"
    --   }
    -- }
  end) then
else
  print('One or more plugins missing. Run `:PackerInstall`!')
end
