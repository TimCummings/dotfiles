return {
  'b0o/incline.nvim',

  config = function()
    require('incline').setup({
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = 'StatusLine',
          },
          InclineNormalNC = {
            default = true,
            group = 'StatusLineNC',
          },
        },
      },

      window = {
        margin = {
          horizontal = 1,
          vertical = 0,
        },
      },
    })
  end,
}
