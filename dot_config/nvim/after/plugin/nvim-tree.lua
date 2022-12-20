local protected_require = require('utils').protected_require

-- no special config, but nvim-tree won't work without calling `setup`
protected_require('nvim-tree')
