return {
  {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',

    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'css',
          'dockerfile',
          'elixir',
          'go',
          'graphql',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'ruby',
          'rust',
          'scss',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },

        highlight = {
          enable = true,              -- false will disable the whole extension
        },

        indent = {
          enable = true,
        }
      })
    end,
  },
}
