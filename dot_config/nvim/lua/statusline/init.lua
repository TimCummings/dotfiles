local ok, _ = pcall(require, 'heirline')
if not ok then
  print('Error requiring heirline plugin in statusline init')
  return
end

-- evaluation order inside a component: condition, update, init, hl, on_click, provider, pick_child;
-- static and restrict are only available during instantiation, so put them before `init`

-- built-in helpers provided by heirline plugin
local conditions = require('heirline.conditions')
-- local utils = require('heirline.utils')

-- custom components
local FileInfoBlock = require('statusline.file_info_block')
local FileNameBlock = require('statusline.file_name_block')
local FileType = require('statusline.file_type')
local HelpFileName = require('statusline.help_file_name')
local Ruler = require('statusline.ruler')
local SearchCount = require('statusline.search_count')
local TerminalName = require('statusline.terminal_name')
local ViMode = require('statusline.vi_mode')

-- mostly Challenger Deep colors, with some Nord
require('heirline').load_colors({
  black       = '#565575',
  dark_black  = '#141228',
  red         = '#ff8080',
  dark_red    = '#ff5458',
  green       = '#95ffa4',
  dark_green  = '#62d196',
  yellow      = '#ffe9aa',
  dark_yellow = '#ffb378',
  blue        = '#91ddff',
  dark_blue   = '#65b2ff',
  purple      = '#c991e1',
  dark_purple = '#906cff',
  cyan        = '#aaffe4',
  dark_cyan   = '#63f2f1',
  white       = '#cbe3e7',
  dark_white  = '#a6b3cc',
  foreground  = '#F3F3F3',
  background  = '#272638',
  fill        = '#100E23',
  info        = '#81a1c1',
})

-- delimiter components
local Align = { provider = '%=' }
local Space = { provider = ' ' }

local DefaultStatusline = {
  ViMode, FileNameBlock, Align,
  SearchCount, Space, FileInfoBlock, Space, Ruler
}

local InactiveStatusline = {
  condition = conditions.is_not_active,
  hl = { bg = 'fill', fg = 'black', force = true },
  { provider = '  ' }, Space, FileNameBlock, Align,
}

local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
      filetype = { '^git.*', 'fugitive' },
    })
  end,

  hl = function()
    return { bg = 'fill', fg = 'info' }
  end,

  FileType, HelpFileName, Align
}

local TerminalStatusline = {
  condition = function()
    return conditions.buffer_matches({ buftype = { 'terminal' } })
  end,

  TerminalName, Align,
}

local StatusLines = {
  hl = function()
    if conditions.is_active() then
      return { bg = 'fill', fg = 'white' }
    else
      return { bg = 'fill', fg = 'black' }
    end
  end,

  -- the first statusline with no condition, or which condition returns true is used.
  -- think of it as a switch case with breaks to stop fallthrough.
  fallthrough = false,

  SpecialStatusline, TerminalStatusline, InactiveStatusline, DefaultStatusline,
}

require('heirline').setup(StatusLines)
