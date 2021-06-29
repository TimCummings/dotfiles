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
wo.breakindentopt = 'shift:1'
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
-- require('nord').set()
-- vim.g.onedark_style = 'dark'
-- vim.g.onedark_style = 'darker'
vim.g.onedark_style = 'cool'
--vim.g.onedark_style = 'deep'
require('onedark').setup()
o.termguicolors = true

-- LSP language servers
require('lspconfig').tsserver.setup{}

require('plugins')
require('mappings')
require('lsp')
require('statusline')
require('colorizer').setup()
require('treesitter_config').setup{
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vue",
    "yaml"
  }
}
