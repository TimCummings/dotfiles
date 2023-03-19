return {
  {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_italic = false
      vim.cmd([[colorscheme nord]])
    end,
    -- lazy = false,
    -- priority = 1000,
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
