return {
  'nvim-telescope/telescope.nvim',

  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { prompt_position = 'top' },
        },
        sorting_strategy = 'ascending',
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('notify')
  end,

  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
}
