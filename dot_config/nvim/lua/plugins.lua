return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope.nvim', requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }}
  }
  use { 'hrsh7th/nvim-compe' }
  use 'shaunsingh/nord.nvim'
  -- use 'navarasu/onedark.nvim'
  use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'mcchrish/nnn.vim'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'norcalli/nvim-colorizer.lua'
end)
