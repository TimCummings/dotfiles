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
else
  print('Error requiring telescope and loading its extensions')
end
