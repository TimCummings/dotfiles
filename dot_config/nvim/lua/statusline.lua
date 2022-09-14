require ('lualine').setup({
  options = {
    theme = require('themes/challenger_deep_custom'),
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {{
      'filename',
      path = 1,
      symbols = {
        modified = ' ✶',
        readonly = ' ',
      },
    }},
    lualine_c = {},
    lualine_x = {{ 'branch', icon = '' }},
    lualine_y = { 'location' },
    lualine_z = { 'progress' },
  }
})
