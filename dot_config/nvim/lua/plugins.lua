-- bootstrap packer
local ensure_packer = function()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- manage plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- performance improvements via compiling and caching
  use 'lewis6991/impatient.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }}
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- LSP completion with sources
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'

  -- snippet engine and source - required for LSP completion
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- linting tie-ins with LSP
  use  { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' }}

  -- colorschemes
  use 'shaunsingh/nord.nvim'
  -- use 'arcticicestudio/nord-vim' -- vim/non-TreeSitter version
  -- use 'navarasu/onedark.nvim'
  -- use 'EdenEast/nightfox.nvim'
  -- use 'rmehri01/onenord.nvim'
  -- use 'marko-cerovac/material.nvim'

  use 'rebelot/heirline.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'luukvbaal/nnn.nvim'
  use 'NvChad/nvim-colorizer.lua'
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'rcarriga/nvim-notify'
  use 'dhruvasagar/vim-table-mode'
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'nvim-orgmode/orgmode'
  use 'akinsho/org-bullets.nvim'
  use 'lukas-reineke/headlines.nvim'

  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- continuation of bootstrap process:
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- printed notice from kickstart.nvim
  if packer_bootstrap then
    require('packer').sync()
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
  end
end)
