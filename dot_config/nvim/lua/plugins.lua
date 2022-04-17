-- bootstrap packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system(
    { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  )
end

-- recompile plugins when this file changes
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',
  { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'plugins.lua' })

-- manage plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- LSP completion with sources
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  -- use { 'ray-x/lsp_signature.nvim' }

  -- snippet engine and source - required for LSP completion
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- colorschemes
  use {
    'shaunsingh/nord.nvim',
    config = function()
      vim.cmd([[
      colorscheme nord

      highlight NonText guifg=#565575

      highlight link NormalFloat Title
      highlight link FloatBorder Title
      highlight TabLine gui=NONE guibg=#100e23 guifg=#565575
      highlight TabLineSel gui=NONE guibg=#272638 guifg=#63f2f1
      highlight TabLineFill gui=NONE guibg=#100e23 guifg=#272638
      highlight TabLineFillInvert gui=NONE guibg=#272638 guifg=#100e23
      highlight TabLineWarn gui=NONE guibg=#272638 guifg=#ffb378

      highlight NvimTreeSymlink guifg=#63f2f1
      highlight NvimTreeFolderName guifg=#00aeff
      highlight NvimTreeFolderIcon guifg=#00aeff
      ]])
    end,
  }
  -- use 'arcticicestudio/nord-vim' -- vim/non-TreeSitter version
  -- use 'navarasu/onedark.nvim'
  -- use 'EdenEast/nightfox.nvim'
  -- use 'rmehri01/onenord.nvim'
  -- use 'marko-cerovac/material.nvim'

  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use 'norcalli/nvim-colorizer.lua'
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'rcarriga/nvim-notify'
end)
