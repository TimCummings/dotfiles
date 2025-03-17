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
          -- chezmoi.vim template syntax highlighting is via Vim builtin, not treesitter
          disable = function()
            -- check if 'filetype' option includes 'chezmoitmpl'
            if string.find(vim.bo.filetype, 'chezmoitmpl') then
              return true
            end
          end,
          enable = true,              -- false will disable the whole extension
        },

        indent = {
          enable = true,
        }
      })
    end,
  },
}
