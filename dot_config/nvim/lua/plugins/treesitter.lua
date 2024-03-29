return {
  {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',

    config = function()
      if pcall( function()
        require('orgmode').setup_ts_grammar()
        end) then
      else
        print('Error requiring plugin: orgmode (inside treesitter config)')
      end

      require('nvim-treesitter.configs').setup({
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
          'markdown',
          'org',
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
          additional_vim_regex_highlighting = { 'org' }, -- TS doesn't support all features, eg. conceal
        },

        indent = {
          enable = true,
        }
      })
    end,
  },
}
