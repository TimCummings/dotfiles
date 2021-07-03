-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

require('plugins')

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

-- required for compe
o.completeopt = "menuone,noselect"

require('mappings')

-- highlight current cursor line
wo.cursorline = true

-- colorscheme
o.termguicolors = true
-- require('nord').set()
-- vim.g.onedark_style = 'dark'
-- vim.g.onedark_style = 'darker'
vim.g.onedark_style = 'cool'
--vim.g.onedark_style = 'deep'

-- vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_char = '│'

vim.api.nvim_exec([[
  augroup Goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  augroup end
]], false)

-- call plugins inside protected call in case they're not installed
if pcall(function()
    -- require('onedark').setup()
    require('nord').set()
    require('colorizer').setup()
    require('statusline')
    require('lsp')
    require('lspconfig').tsserver.setup{}
    require('treesitter_config').setup()
    -- installing parsers currently locks up VPS
    -- manually install parsers one at a time for now with `:TSInstall`
    -- possible issue match: https://github.com/nvim-treesitter/nvim-treesitter/issues/1254
    -- require('treesitter_config').setup{
    --   ensure_installed = {
    --     "bash",
    --     "comment",
    --     "css",
    --     "dockerfile",
    --     "go",
    --     "gomod",
    --     "graphql",
    --     "html",
    --     "javascript",
    --     "jsdoc",
    --     "json",
    --     "lua",
    --     "python",
    --     "query",
    --     "regex",
    --     "ruby",
    --     "rust",
    --     "scss",
    --     "toml",
    --     "tsx",
    --     "typescript",
    --     "vue",
    --     "yaml"
    --   }
    -- }
    require('compe').setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = true;

      source = {
        path = true;
        nvim_lsp = true;
      };
    }
  end) then
else
  print('One or more plugins missing. Run `:PackerInstall`!')
end
