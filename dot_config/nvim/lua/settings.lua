local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- various tab related settings
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.shiftround = true  -- round indent to multiple of `shiftwidth`
o.smarttab = true
o.autoindent = true
bo.smartindent = true
o.joinspaces = false -- don't insert an extra space when joining lines (J)

-- indent and wrap settings
wo.breakindent = true
wo.linebreak = true

-- keep lines above/below cursor when at top/bottom of file
o.scrolloff = 5

-- show absolute line numbers
o.number = true

-- status line
o.laststatus = 2
o.showmode = false

-- copy to system clipboard?
o.clipboard = 'unnamed'

-- open new split panes to right and bottom
o.splitbelow = true
o.splitright = true

-- display hidden characters
o.listchars = 'tab:>-,trail:~,extends:>,precedes:<,nbsp:~'
wo.list = true
o.showbreak = '↪ '

o.ignorecase = true
o.smartcase = true

-- highlight current cursor line
wo.cursorline = true

-- colorscheme
o.termguicolors = true
vim.g.nord_contrast = true
vim.g.nord_borders = true
-- vim.g.onedark_style = 'dark'
-- vim.g.onedark_style = 'darker'
-- vim.g.onedark_style = 'cool'
--vim.g.onedark_style = 'deep'

vim.api.nvim_exec([[
  augroup Goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  augroup end
]], false)

-- color adjustments
vim.api.nvim_exec([[
  function! MyHighlights() abort
    highlight link NormalFloat Title
    highlight link FloatBorder Title
    highlight TabLine gui=NONE guibg=#100e23 guifg=#565575
    highlight TabLineSel gui=NONE guibg=#272638 guifg=#63f2f1
    highlight TabLineFill gui=NONE guibg=#100e23 guifg=#272638
    highlight TabLineFillInvert gui=NONE guibg=#272638 guifg=#100e23
    highlight TabLineWarn gui=NONE guibg=#272638 guifg=#ffb378
  endfunction

  augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
  augroup END
]], false)
