return {
  'nvim-telescope/telescope.nvim',

  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { prompt_position = 'top' },
        },
        mappings = {
          i = {
            ['<C-x>'] = actions.select_vertical,
            ['<C-v>'] = actions.select_horizontal,
          },
          n = {
            ['<C-x>'] = actions.select_vertical,
            ['<C-v>'] = actions.select_horizontal,
          },
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
