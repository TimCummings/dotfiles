require ('lualine').setup{
  options = {
    symbols = {
      modified = ' ✶',
      readonly = ' ',
    },
    theme = require('themes/challenger_deep_custom')
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {{'branch', icon = ''}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
