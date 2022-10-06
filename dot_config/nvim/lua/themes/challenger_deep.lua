-- =============================================================================
-- Genarated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- Credit: Challenger Deep - https://github.com/challenger-deep-theme/vim
-- =============================================================================
local colors = {
  cyan       = '#aaffe4',
  darkyellow = '#ffb378',
  yellow     = '#ffe9aa',
  foreground = '#565575',
  darkgreen  = '#62d196',
  green      = '#95ffa4',
  darkred    = '#ff5458',
  red        = '#ff8080',
  black      = '#100E23',
  darkcyan   = '#63f2f1',
  white      = '#F3F3F3',
}

local challenger_deep = {
  normal = {
    a = { fg = colors.black, bg = colors.cyan , gui = 'bold', },
    b = { fg = colors.black, bg = colors.darkcyan },
    c = { fg = colors.white, bg = colors.black },
  },
  visual = {
    a = { fg = colors.black, bg = colors.yellow , gui = 'bold', },
    b = { fg = colors.black, bg = colors.darkyellow },
  },
  inactive = {
    a = { fg = colors.foreground, bg = colors.black , gui = 'bold', },
    b = { fg = colors.foreground, bg = colors.black },
    c = { fg = colors.foreground, bg = colors.black },
  },
  replace = {
    a = { fg = colors.black, bg = colors.green , gui = 'bold', },
    b = { fg = colors.black, bg = colors.darkgreen },
  },
  insert = {
    a = { fg = colors.black, bg = colors.red , gui = 'bold', },
    b = { fg = colors.black, bg = colors.darkred },
  },
}

return challenger_deep
