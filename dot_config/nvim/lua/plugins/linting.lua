return {
  'jose-elias-alvarez/null-ls.nvim',

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      -- to debug, uncomment the next line & use commands `:NullLsInfo` & `:NullLsLog`
      -- debug = true,
      sources = {
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.yamllint,
      },
    })
  end,
}
