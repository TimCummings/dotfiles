local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup{
    ensure_installed = { 'norg' },
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    indent = {
      enable = true,
    },
  }
end

return M
