-- list of plugins that don't need much special configuration
return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  { 'tpope/vim-fugitive', cmd = 'G', },
  { 'junegunn/goyo.vim', cmd = 'Goyo', },
  { 'junegunn/limelight.vim', cmd = 'Goyo', },
  { 'dhruvasagar/vim-table-mode', cmd = { 'TableModeEnable', 'TableModeToggle' }, keys = '<Leader>tm' },

  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end,
    event = 'VeryLazy',
  },

  {
    'echasnovski/mini.bracketed',
    config = function() require('mini.bracketed').setup() end,
    event = 'VeryLazy',
    version = false
  },

  {
    'iamcco/markdown-preview.nvim',
    config = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
  },
}
