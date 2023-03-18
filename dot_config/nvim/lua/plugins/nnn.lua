return {
  'luukvbaal/nnn.nvim',

  config = function()
    local nnn = require('nnn')
    local builtin = nnn.builtin

    local opts = {
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
    }

    nnn.setup(opts)
  end,
}
