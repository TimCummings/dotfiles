highlight clear
let colors_name = "cooler"

let s:black = "#000000"
" let s:blue = "#407fbf"
let s:blue = "#4d8ccb"
" let s:blue_dark = "#24283b" " Tokyo Night Default background
let s:blue_dark = "#1d2030"
let s:cyan = "#53bcc6"
let s:gray = "#a6b3cc" " Challenger Deep gray
let s:gray_dark = "#565f89" " Tokyo Night comment
let s:green = "#70c28b"
let s:green_bright = "#70c270"
let s:none = "NONE"
let s:orange = "#c7996b"
let s:orange_bright = "#dca561"
let s:purple = "#7766cc"
let s:red = "#d16161"
let s:white = "#cbe3e7"
let s:white_dark = "#afbcdf"
let s:yellow="#c7bf6b"

let s:bg = s:blue_dark
" let s:fg = "#82a6c9"
let s:fg = s:white_dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" suggested groups (`:h group`)
hi! Normal guibg=#1d2030 guifg=#afbcdf gui=NONE
" execute 'hi! Normal guibg=' .. s:bg 'guifg=' .. s:fg
hi! link NormalNC Normal

hi! Comment guifg=#565f89 gui=NONE

hi! Constant guifg=#c7996b gui=NONE
hi! link Boolean Special
hi! String guifg=#70c28b gui=NONE
hi! link Delimiter String

hi! Identifier guifg=#53bcc6 gui=NONE
" hi! Function guifg=#afbcdf gui=NONE
hi! Function guifg=#4d8ccb gui=NONE

hi! Statement guifg=#7766cc gui=NONE
hi! Operator guifg=#82a6c9 gui=NONE

hi! PreProc guifg=#7766cc gui=NONE

hi! Type guifg=#4d8ccb gui=NONE
hi! Structure guifg=#82a6c9 gui=NONE

hi! Special guifg=#4d60cb gui=NONE

hi! Underlined guifg=#cbe3e7 gui=underline

hi! Ignore guifg=#3f4876

hi! DiagnosticOk guifg=#5eed8e gui=NONE
hi! DiagnosticInfo guifg=#cbe3e7 gui=NONE
hi! link DiagnosticFloatingInfo NormalFloat
" hi! WarningMsg guifg=#ffb366
hi! WarningMsg guifg=#eda65e
hi! link DiagnosticWarn WarningMsg
" hi! Error guibg=#1d2030 guifg=#d16161 gui=NONE
hi! Error guibg=#1d2030 guifg=#ff6666 gui=NONE
hi! link ErrorMsg Error
hi! link DiagnosticError Error

hi! Todo guibg=#1d2030 guifg=#c7996b gui=NONE
" suggested groups (`:h group`)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi! link Conceal Comment
hi! Cursor guibg=#afbcdf guifg=#1d2030
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! Directory guifg=#00aeff
hi! DiffAdd guibg=#283b4d
hi! DiffChange guibg=#272d43
hi! DiffDelete guibg=#3f2d3d
hi! DiffText guibg=#394b70
hi! MatchParen guibg=#1d2030 guifg=DarkCyan gui=bold
hi! link TermCursor Cursor
hi! link TermCursorNC Cursor
hi! link Title Type
hi! WinSeparator guifg=#131520
hi! Substitute guibg=#d16161 guifg=#1d2030

hi! Folded guibg=#1d2030 guifg=#888888
hi! link FoldColumn Folded
hi! link CursorLineFold Folded

hi! link ColorColumn CursorLine
hi! link CursorColumn CursorLine
hi! CursorLine guibg=#212436
hi! CursorLineNr guifg=#82a6c9 gui=NONE
hi! link CursorLineSign SignColumn
hi! LineNr guifg=#474d6b gui=NONE
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link SignColumn LineNr

hi! link ModeMsg Normal
hi! link MsgArea Normal
hi! link MsgSeparator Normal
hi! link MoreMsg Comment

hi! CurSearch guibg=#e5d352 guifg=#1d2030
hi! link IncSearch CurSearch
hi! Search guibg=#4553a1 guifg=#cbe3e7
hi! Visual guibg=#2d3353
hi! link VisualNOS Visual

hi! FloatBorder guifg=#82a6c9
" hi! NormalFloat guibg=#161927 guifg=#afbcdf gui=NONE
hi! link NormalFloat Normal
hi! FloatTitle guifg=#cbe3e7 gui=NONE
hi! Pmenu guibg=#161927
hi! PmenuSel guibg=#242942
hi! link PmenuKind Pmenu
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtra Pmenu
hi! link PmenuExtraSel PmenuSel
hi! PmenuSbar guibg=#292d3d
hi! PmenuThumb guibg=#565f89
hi! link Question Type
hi! link QuickFixLine CursorLine
hi! link SpecialKey Comment

hi! SpellBad cterm=undercurl gui=undercurl guisp=#d16161
hi! SpellCap cterm=undercurl gui=undercurl guisp=#c7996b
hi! SpellLocal cterm=undercurl gui=undercurl guisp=#53bcc6
hi! SpellRare cterm=undercurl gui=undercurl guisp=#70c28b

hi! link StatusLine Normal
hi! StatusLineNC guibg=#161927 guifg=#565f89
hi! TabLine guibg=#161927 guifg=#565f89 gui=NONE
hi! TabLineFill guifg=#161927
hi! TabLineSel guibg=#1d2030 guifg=#53bcc6 gui=NONE

hi! link Whitespace Ignore
hi! link WildMenu PmenuSel
hi! WinBar guibg=#1d2030 guifg=#afbcdf gui=bold
hi! link WinBarNC WinBar

hi! EndOfBuffer guifg=#1d2030 gui=NONE
hi! NonText guifg=#565f89 gui=NONE
