local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- experiment with filetype.lua file type detection beta
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- disable "hidden" buffers
o.hidden = false

-- diagnostics settings
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
})

local signs = { Error = ' ', Hint = ' ', Info = ' ', Warn = ' ' }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
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
-- o.showbreak = '↪ '

o.ignorecase = true
o.smartcase = true

-- highlight current cursor line
wo.cursorline = true

if pcall(function()
  vim.notify = require('notify')
  vim.notify.setup({
    background_colour = '#2e3440',
    stages = 'slide',
  })
  require('telescope').setup({
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = { prompt_position = "top" }
      },
    },
  })
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('notify')

  vim.g.table_mode_corner = '|'
end) then
else
  print('One or more plugins missing. Run `:PackerInstall`!')
end

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
