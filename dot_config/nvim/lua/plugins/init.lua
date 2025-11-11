-- list of plugins that don't need much special configuration
return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  { 'tpope/vim-fugitive', cmd = 'G', },
  { 'junegunn/goyo.vim' },
  { 'junegunn/limelight.vim' },
  { 'dhruvasagar/vim-table-mode', cmd = { 'TableModeEnable', 'TableModeToggle' }, keys = '<Leader>vtm' },

  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
  },

  {
    'echasnovski/mini.bracketed',
    config = function() require('mini.bracketed').setup() end,
    event = 'VeryLazy',
    version = false
  },

  { -- syntax highlighting in chezmoi templates
    'alker0/chezmoi.vim',
    lazy = false,
    init = function()
      vim.g['chezmoi#use_tmp_buffer'] = true
    end,
  },
}
