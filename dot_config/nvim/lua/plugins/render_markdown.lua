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
      language_icon = false,
    },

    dash = {
      highlight = 'FloatBorder',
    },

    heading = {
      -- above = '▁',
      -- below = '▔',
      border = false,
      -- border_virtual = true,
      icons = { '◆ ', '◇ ', '● ', '◯ ', '▶ ', '▷ ' },
    },

    pipe_table = {
      head = 'FloatBorder',
      row = 'FloatBorder',
    },

    sign = { enabled = false },
  },
}
