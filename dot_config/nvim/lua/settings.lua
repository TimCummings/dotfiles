local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- diagnostics settings
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
})

local signs = { Error = ' ', Hint = ' ', Info = ' ', Warn = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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

o.ignorecase = true
o.smartcase = true

-- neovide GUI
if vim.g.neovide == true then
  vim.o.guifont = 'JetBrains Mono NL,Symbols Nerd Font Mono:h12'
end

vim.g.table_mode_corner = '|'

-- autocommands & augroups
-- Goyo & Limelight
vim.api.nvim_create_augroup('Goyo', { clear = true })
vim.api.nvim_exec([[
  augroup Goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  augroup end
]], false)

vim.api.nvim_create_augroup('Org', { clear = true })
vim.api.nvim_create_autocmd('BufEnter',
{
  desc = 'aggressive conceal for org files',
  group = 'Org',
  pattern = '*.org',
  callback = function()
    vim.opt_local.conceallevel = 2
    -- vim.opt_local.concealcursor = 'nc'
  end,
})
