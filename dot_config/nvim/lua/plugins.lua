return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
  }

  -- LSP
  use 'neovim/nvim-lspconfig'

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
  use 'shaunsingh/nord.nvim'
  -- use 'arcticicestudio/nord-vim' -- vim/non-TreeSitter version
  use 'navarasu/onedark.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'rmehri01/onenord.nvim'
  use 'marko-cerovac/material.nvim'

  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'mcchrish/nnn.vim'
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'norcalli/nvim-colorizer.lua'
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'rcarriga/nvim-notify'
end)
