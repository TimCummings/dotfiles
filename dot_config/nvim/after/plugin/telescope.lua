-- `protected_require` util is not a good fit here: need to do more than just setup with opts
local ok, telescope = pcall(require, 'telescope')

if ok then
  telescope.setup({
    defaults = {
      sorting_strategy = 'ascending',
      layout_config = {
        horizontal = { prompt_position = 'top' }
      },
    },
  })

  telescope.load_extension('fzf')
  telescope.load_extension('notify')

  vim.keymap.set('n', '<Leader>f', require('telescope.builtin').find_files)
  vim.keymap.set('n', '<Leader>rg', require('telescope.builtin').live_grep)
  vim.keymap.set('n', '<Leader>tb', require('telescope.builtin').buffers)
  vim.keymap.set('n', '<Leader>tc', require('telescope.builtin').commands)
  vim.keymap.set('n', '<Leader>tq', require('telescope.builtin').quickfix)
  vim.keymap.set('n', '<Leader>tl', require('telescope.builtin').loclist)
  vim.keymap.set('n', '<Leader>tn', require('telescope').extensions.notify.notify)
  vim.keymap.set('n', '<Leader>tr', require('telescope.builtin').registers)
  vim.keymap.set('n', '<Leader>tgc', require('telescope.builtin').git_commits)
  vim.keymap.set('n', '<Leader>tgb', require('telescope.builtin').git_branches)
  vim.keymap.set('n', '<Leader>tgs', require('telescope.builtin').git_status)
else
  print('Error requiring telescope and loading its extensions')
end
