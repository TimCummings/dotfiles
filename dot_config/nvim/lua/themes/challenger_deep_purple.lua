-- Credit:
--   inspired by and heavily pulls from [Challenger Deep](https://github.com/challenger-deep-theme/vim)
-- LuaFormatter off
local colors = {
  black        = '#100e23',
  subtleblack  = '#303030',
  white        = '#fbfcfc',
  red          = '#ff8080',
  green        = '#62d196',
  blue         = '#91ddff',
  cyan         = '#aaffe4',
  darkcyan     = '#63f2f1',
  purple       = '#906cff',
  yellow       = '#ffb378',
  gray         = '#a6b3cc',
  darkgray     = '#1e1c31',
  lightgray    = '#cbe3e7',
  inactivegray = '#a6b3cc',
}

-- LuaFormatter on
return {
  normal = {
    a = {bg = colors.blue, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.purple},
    c = {bg = colors.black, fg = colors.gray}
  },
  insert = {
    a = {bg = colors.green, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.purple},
    c = {bg = colors.black, fg = colors.gray}
  },
  visual = {
    a = {bg = colors.darkcyan, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.purple},
    c = {bg = colors.black, fg = colors.gray}
  },
  replace = {
    a = {bg = colors.red, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.purple},
    c = {bg = colors.black, fg = colors.gray}
  },
  command = {
    a = {bg = colors.yellow, fg = colors.darkgray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.purple},
    c = {bg = colors.black, fg = colors.gray}
  },
  inactive = {
    a = {bg = colors.subtleblack, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.subtleblack, fg = colors.gray},
    c = {bg = colors.subtleblack, fg = colors.gray}
  }
}
