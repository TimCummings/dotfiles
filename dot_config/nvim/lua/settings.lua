local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- temporary workaround for display artifact bug; remove after next Wezterm release
-- https://github.com/wezterm/wezterm/issues/4607
vim.opt.termsync=false

-- diagnostics settings
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '· ',
      [vim.diagnostic.severity.WARN] = '· ',
      [vim.diagnostic.severity.INFO] = '· ',
      [vim.diagnostic.severity.HINT] = '· ',
    },
  },
})

-- always show sign column, even if empty
-- prevents annoying "stutter" as signs come and go
wo.signcolumn = 'yes:1'

-- various tab related settings
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.shiftround = true  -- round indent to multiple of `shiftwidth`
bo.smartindent = true

-- indent and wrap settings
wo.breakindent = true
wo.linebreak = true

-- keep lines above/below cursor when at top/bottom of file
o.scrolloff = 3

-- show absolute line numbers
o.number = true
o.relativenumber = true

-- disable mouse
o.mouse = ''

-- status line
o.laststatus = 3
o.showmode = false

-- copy to system clipboard
o.clipboard = 'unnamedplus'

-- open new split panes to right and bottom
o.splitbelow = true
o.splitright = true

-- display hidden characters
o.listchars = 'tab:>-,trail:~,extends:>,precedes:<,nbsp:~'
wo.list = true

o.ignorecase = true
o.smartcase = true

-- neovide GUI
if vim.g.neovide == true then
  vim.o.guifont = 'JetBrains Mono NL,Symbols Nerd Font Mono:h12'
end

vim.g.table_mode_corner = '|'
-- keymap change alone is not sufficient; plugin sets mappings again upon activation :(
vim.g.table_mode_map_prefix = '<Leader>vt'

-- autocommands & augroups
-- Goyo & Limelight
vim.api.nvim_create_augroup('Goyo', { clear = true })
vim.api.nvim_exec([[
  augroup Goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  augroup end
]], false)
