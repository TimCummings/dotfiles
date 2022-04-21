require('plugins')
require('highlights')
require('mappings')
require('settings')
require('tabline')

-- call plugins inside protected call in case they're not installed
if pcall(function()
    -- require('onedark').setup()
    require('colorizer').setup()
    require('statusline')
    require('nvim-tree').setup()

    require('lsp')
    require('treesitter_config').setup()
    -- installing parsers currently locks up VPS
    -- manually install parsers one at a time for now with `:TSInstall`
    -- possible issue match: https://github.com/nvim-treesitter/nvim-treesitter/issues/1254
    -- require('treesitter_config').setup{
    --   ensure_installed = {
    --     "bash",
    --     "comment",
    --     "css",
    --     "dockerfile",
    --     "go",
    --     "gomod",
    --     "graphql",
    --     "html",
    --     "javascript",
    --     "jsdoc",
    --     "json",
    --     "lua",
    --     "python",
    --     "query",
    --     "regex",
    --     "ruby",
    --     "rust",
    --     "scss",
    --     "toml",
    --     "tsx",
    --     "typescript",
    --     "vue",
    --     "yaml"
    --   }
    -- }
  end) then
else
  print('One or more plugins missing. Run `:PackerInstall`!')
end
