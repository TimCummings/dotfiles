local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup{
    ensure_installed = {
      'bash',
      'css',
      'dockerfile',
      'go',
      'graphql',
      'html',
      'javascript',
      'json',
      'lua',
      'ruby',
      'rust',
      'scss',
      'typescript',
      'yaml',
    },
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    indent = {
      enable = false,
    },
  }
end

return M
