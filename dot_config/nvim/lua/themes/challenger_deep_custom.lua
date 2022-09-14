-- =============================================================================
-- Copy of Challenger Deep with light modifications:
--   - rearrange some of the mode colors
--   - add a section for COMMAND mode
-- License: MIT License
-- Credit: Challenger Deep - https://github.com/challenger-deep-theme/vim
-- =============================================================================
local colors = {
  cyan       = "#aaffe4",
  darkyellow = "#ffb378",
  yellow     = "#ffe9aa",
  foreground = "#565575",
  darkgreen  = "#62d196",
  green      = "#95ffa4",
  darkred    = "#ff5458",
  red        = "#ff8080",
  black      = "#100E23",
  darkcyan   = "#63f2f1",
  white      = "#F3F3F3",
}

local challenger_deep_custom = {
  normal = {
    a = { fg = colors.black, bg = colors.darkcyan, gui = "bold", },
    b = { fg = colors.white, bg = colors.black },
    x = { fg = colors.white, bg = colors.black },
    y = { fg = colors.black, bg = colors.cyan },
    z = { fg = colors.black, bg = colors.darkcyan },
  },
  visual = {
    a = { fg = colors.black, bg = colors.darkyellow, gui = "bold", },
    b = { fg = colors.white, bg = colors.black },
    x = { fg = colors.white, bg = colors.black },
    y = { fg = colors.black, bg = colors.yellow, },
    z = { fg = colors.black, bg = colors.darkyellow, },
  },
  command = {
    a = { fg = colors.black, bg = colors.darkyellow, gui = "bold", },
    b = { fg = colors.white, bg = colors.black },
    x = { fg = colors.white, bg = colors.black },
    y = { fg = colors.black, bg = colors.yellow, },
    z = { fg = colors.black, bg = colors.darkyellow, },
  },
  inactive = {
    a = { fg = colors.foreground, bg = colors.black, gui = "bold", },
    b = { fg = colors.foreground, bg = colors.black },
  },
  replace = {
    a = { fg = colors.black, bg = colors.darkred, gui = "bold", },
    b = { fg = colors.white, bg = colors.black },
    x = { fg = colors.white, bg = colors.black },
    y = { fg = colors.black, bg = colors.red, },
    z = { fg = colors.black, bg = colors.darkred, },
  },
  insert = {
    a = { fg = colors.black, bg = colors.darkgreen, gui = "bold", },
    b = { fg = colors.white, bg = colors.black },
    x = { fg = colors.white, bg = colors.black },
    y = { fg = colors.black, bg = colors.green, },
    z = { fg = colors.black, bg = colors.darkgreen, },
  },
}

return challenger_deep_custom
