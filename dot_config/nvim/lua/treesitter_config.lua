local M = {}
local conf = require 'nvim-treesitter.configs'

function M.setup()
  conf.setup{
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    indent = {
      enable = true,
    },
  }
end

return M
