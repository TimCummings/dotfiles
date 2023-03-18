return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    local opts = {
      defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = { prompt_position = 'top' },
        },
      },
    }

    telescope.setup(opts)

    telescope.load_extension('fzf')
    telescope.load_extension('notify')

    vim.keymap.set('n', '<Leader>f', builtin.find_files)
    vim.keymap.set('n', '<Leader>rg', builtin.live_grep)
    vim.keymap.set('n', '<Leader>tb', builtin.buffers)
    vim.keymap.set('n', '<Leader>tc', builtin.commands)
    vim.keymap.set('n', '<Leader>tq', builtin.quickfix)
    vim.keymap.set('n', '<Leader>tl', builtin.loclist)
    vim.keymap.set('n', '<Leader>tn', telescope.extensions.notify.notify)
    vim.keymap.set('n', '<Leader>tr', builtin.registers)
    vim.keymap.set('n', '<Leader>tgc', builtin.git_commits)
    vim.keymap.set('n', '<Leader>tgb', builtin.git_branches)
    vim.keymap.set('n', '<Leader>tgs', builtin.git_status)
  end,
}
