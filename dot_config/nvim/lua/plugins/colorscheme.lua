return {
  {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_italic = false
      -- vim.cmd([[colorscheme nord]])
    end,
    enabled = true,
    -- lazy = false,
    -- priority = 1000,
  },

  {
    'folke/tokyonight.nvim',
    config = function()
    --   require('tokyonight').setup({
    --     style = 'night',
    --   })
      vim.cmd([[colorscheme tokyonight]])
    end,
    lazy = false,
    priority = 1000,
  },

  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
    enabled = false,
  },

  { 'arcticicestudio/nord-vim', enabled = false }, -- vim/non-TreeSitter version

  {
    'navarasu/onedark.nvim',
    config = function()
      vim.g.onedark_style = 'dark'
      vim.g.onedark_style = 'darker'
      vim.g.onedark_style = 'cool'
      vim.g.onedark_style = 'deep'
      vim.cmd([[colorscheme onedark]])
    end,
    enabled = false,
    lazy = false,
    priority = 1000,
  },

  { 'EdenEast/nightfox.nvim', enabled = false },
  { 'rmehri01/onenord.nvim', enabled = false },
  { 'marko-cerovac/material.nvim', enabled = false },
}
