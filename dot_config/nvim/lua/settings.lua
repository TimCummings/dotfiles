local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- experiment with filetype.lua file type detection beta
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- disable "hidden" buffers
o.hidden = false

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
-- o.showbreak = '↪ '

o.ignorecase = true
o.smartcase = true

-- highlight current cursor line
wo.cursorline = true

-- colorscheme
o.termguicolors = true
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = false
-- vim.g.onedark_style = 'dark'
-- vim.g.onedark_style = 'darker'
-- vim.g.onedark_style = 'cool'
--vim.g.onedark_style = 'deep'

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
end) then
else
  print('One or more plugins missing. Run `:PackerInstall`!')
end

-- autocommands & augroups
vim.api.nvim_create_augroup('Goyo', { clear = true })
vim.api.nvim_exec([[
  augroup Goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  augroup end
]], false)

local colorscheme_group = vim.api.nvim_create_augroup('Colorscheme', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
    group = colorscheme_group,
    desc = 'set colorscheme and custom highlights',
    callback = function()
      vim.api.nvim_set_hl(0, 'NonText', { fg = '#565575' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { fg = '#a3be8c', bold = true })
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#a3be8c', bold = true })
      vim.api.nvim_set_hl(0, 'TabLine', { bg = '#100e23', fg = '#565575' })
      vim.api.nvim_set_hl(0, 'TabLineSel', { bg = '#272638', fg = '#63f2f1' })
      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = '#100e23', fg = '#272638' })
      vim.api.nvim_set_hl(0, 'TabLineFillInvert', { bg = '#272638', fg = '#100e23' })
      vim.api.nvim_set_hl(0, 'TabLineWarn', { bg = '#272638', fg = '#ffb378' })

      vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = '#63f2f1' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = '#00aeff' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = '#00aeff' })

      vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = '#f70067' })
      vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = '#d484ff' })
      vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = '#a9ff68' })
      vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = '#f79000' })
    end,
})

vim.cmd('colorscheme nord')
