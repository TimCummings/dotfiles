local M = {}
local conf = require 'nvim-treesitter.configs'

function M.setup()
  conf.setup{
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    indent = {
      enable = true,
    },
  }
end

return M
