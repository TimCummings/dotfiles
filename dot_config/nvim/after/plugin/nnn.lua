-- `protected_require` util is not a good fit here: need to do more than just setup with opts
local ok, nnn = pcall(require, 'nnn')

if ok then
  local builtin = nnn.builtin

  nnn.setup({
    explorer = {
      cmd = 'nnn-nerd-static -oR',
      fullscreen = false,
    },
    picker = {
      cmd = 'nnn-nerd-static -oR',
      style = { border = 'rounded' },
      fullscreen = false,
    },
    mappings = {
      { '<C-t>', builtin.open_in_tab },       -- open file(s) in tab
      { '<C-x>', builtin.open_in_split },     -- open file(s) in split
      { '<C-v>', builtin.open_in_vsplit },    -- open file(s) in vertical split
      -- { '<C-p>', builtin.open_in_preview },   -- open file in preview split keeping nnn focused
      { '<C-y>', builtin.copy_to_clipboard }, -- copy file(s) to clipboard
      { '<C-w>', builtin.cd_to_path },        -- cd to file directory
      -- { '<C-e>', builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
    },
    auto_close = false,
    quitcd = 'cd',
  })
else
  print('Error requiring plugin: nnn')
end
