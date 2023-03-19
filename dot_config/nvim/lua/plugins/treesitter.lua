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
          'help',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'org',
          'query', -- for Treesitter Playground
          'ruby',
          'rust',
          'scss',
          'typescript',
          'vim',
          'yaml',
        },

        highlight = {
          enable = true,              -- false will disable the whole extension
          additional_vim_regex_highlighting = { 'org' }, -- TS doesn't support all features, eg. conceal
        },

        indent = {
          enable = false,
        }
      })
    end,
  },


  { 'nvim-treesitter/playground' },
}
