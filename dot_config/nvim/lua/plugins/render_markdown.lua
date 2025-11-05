return {
  'MeanderingProgrammer/render-markdown.nvim',

  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    bullet = {
      icons = { '•', '-', '∘' },
    },

    heading = {
      above = '▁',
      below = '▔',
      border = true,
      border_virtual = true,
      icons = { '◆ ', '◇ ', '● ', '◯ ', '▶ ', '▷ ' },
    },

    sign = { enabled = false },
  },
}
