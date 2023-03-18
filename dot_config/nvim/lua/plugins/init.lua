-- list of plugins that don't need much special configuration
-- TODO: what else can be made lazy? Or VeryLazy?
return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'junegunn/goyo.vim',
  'junegunn/limelight.vim',

  { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },

  { 'dhruvasagar/vim-table-mode', lazy = true, keys = '<Leader>tm' },

  {
    'iamcco/markdown-preview.nvim',
    config = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
    lazy = true,
  },
}
