local map = vim.api.nvim_set_keymap
opts = { noremap = true }

-- Leader Key Mappings
map('', '<Leader>y', '"+y', opts)
map('', '<Leader>h', ':noh<CR>', opts)
map('', '<Leader>rl', ':set rnu!<CR>', opts)
map('i', '<Leader><Tab>', '<C-X><C-O>', opts)

-- Telescope Mappings
map('n', '<Leader>tf', '<cmd>Telescope find_files<cr>', opts)
map('n', '<Leader>tb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<Leader>tc', '<cmd>Telescope commands<cr>', opts)
map('n', '<Leader>tq', '<cmd>Telescope quickfix<cr>', opts)
map('n', '<Leader>tl', '<cmd>Telescope loclist<cr>', opts)
map('n', '<Leader>tr', '<cmd>Telescope registers<cr>', opts)
map('n', '<Leader>tgc', '<cmd>Telescope git_commits<cr>', opts)
map('n', '<Leader>tgb', '<cmd>Telescope git_branches<cr>', opts)
map('n', '<Leader>tgs', '<cmd>Telescope git_status<cr>', opts)
