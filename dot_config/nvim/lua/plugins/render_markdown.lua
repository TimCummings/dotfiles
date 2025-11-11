return {
  'MeanderingProgrammer/render-markdown.nvim',

  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    bullet = {
      hightlight = 'FloatBorder',
      icons = { '•', '-', '∘' },
    },

    code = {
      conceal_delimiters = false,
      highlight_language = 'Comment',
    },

    dash = {
      highlight = 'FloatBorder',
    },

    heading = {
      border = false,
      icons = { '◆ ', '◇ ', '● ', '◯ ', '▶ ', '▷ ' },
      right_pad = 2,
      width = { 'full', 'full', 'block' },
    },

    pipe_table = {
      head = 'FloatBorder',
      row = 'FloatBorder',
    },

    sign = { enabled = false },
  },
}
