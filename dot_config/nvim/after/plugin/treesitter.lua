local protected_require = require('utils').protected_require

if pcall( function()
  require('orgmode').setup_ts_grammar()
end) then
else
  print('Error requiring plugin: orgmode (inside treesitter config)')
end

protected_require('nvim-treesitter.configs', {
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'go',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'org',
    'ruby',
    'rust',
    'scss',
    'typescript',
    'yaml',
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = { 'org' }, -- TS doesn't support all features, eg. conceal
  },
  indent = {
    enable = false,
  }
})
