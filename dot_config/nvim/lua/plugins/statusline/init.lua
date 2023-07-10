-- TODO: fix broken highlights when leaving `:Goyo`
-- TODO: move tabline config into here
-- TODO: customize bufferline
-- TODO: possibly replace tabline with bufferline?
-- TODO: what other lines are there?
return {
  'rebelot/heirline.nvim',

  event = 'UiEnter',

  config = function()
    -- evaluation order inside a component: condition, update, init, hl, on_click, provider, pick_child;
    -- static and restrict are only available during instantiation, so put them before `init`

    -- built-in helpers provided by heirline plugin
    local conditions = require('heirline.conditions')
    -- local utils = require('heirline.utils')

    -- custom components
    local FileInfoBlock = require('plugins.statusline.file_info_block')
    local FileNameBlock = require('plugins.statusline.file_name_block')
    local FileType = require('plugins.statusline.file_type')
    local HelpFileName = require('plugins.statusline.help_file_name')
    local MacroRecord = require('plugins.statusline.macro_record')
    local Ruler = require('plugins.statusline.ruler')
    local SearchCount = require('plugins.statusline.search_count')
    local TerminalName = require('plugins.statusline.terminal_name')
    local ViMode = require('plugins.statusline.vi_mode')

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
      MacroRecord, Space, SearchCount, Space, FileInfoBlock, Space, Ruler
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

    require('heirline').setup({ statusline = StatusLines })
  end,
}
