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

-- recompile plugins when this file changes
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',
  { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'plugins.lua' })

-- manage plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- performance improvements via compiling and caching
  use 'lewis6991/impatient.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
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
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        action_keys = {
          cancel = {},
          close = '<esc>',
        },
        auto_close = true,
      }
    end
  }
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
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        user_default_options = { names = false }
      })
    end
  }
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'rcarriga/nvim-notify'
  use 'dhruvasagar/vim-table-mode'

  -- Org Mode
  use { 'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup({})
    end
  }
  use { 'akinsho/org-bullets.nvim',
    config = function()
      require('org-bullets').setup({
        symbols = {
          checkboxes = {
            half = { '◯', 'OrgTSCheckboxHalfChecked' },
            done = { '✓', 'OrgDone' },
            todo = { '✕', 'OrgTODO' },
          },
          headlines = { '◆', '◇', '●', '◯', '▶', '▷' },
        },
      })
    end
  }
  use { 'lukas-reineke/headlines.nvim',
    config = function()
      require('headlines').setup({
        markdown = { dash_string = '─' },
        org = { dash_string = '─' },
      })
    end,
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- continuation of bootstrap process:
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
