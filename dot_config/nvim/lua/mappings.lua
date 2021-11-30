local map = require('utils').map

-- center screen after searching
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- move lines easily
map('n', '<C-j>', '<esc>:m .+1<CR>==', { silent = true })
map('n', '<C-k>', '<esc>:m .-2<CR>==', { silent = true })
map('v', '<C-j>', ":m '>+1<CR>gv=gv", { silent = true })
map('v', '<C-k>', ":m '<-2<CR>gv=gv", { silent = true })

-- Leader Key Mappings
map('', '<Leader>y', '"+y')
map('n', '<Leader>.', '<cmd>lua require("utils").yank_full_path()<CR>')
map('', '<Leader>h', ':noh<CR>', { silent = true })
map('', '<Leader>rl', ':set rnu!<CR>', { silent = true })
map('i', '<Leader><Tab>', '<C-X><C-O>')
map('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>')

-- Telescope Mappings
map('n', '<Leader>f', '<cmd>Telescope find_files<CR>')
map('n', '<Leader>tb', '<cmd>Telescope buffers<CR>')
map('n', '<Leader>tc', '<cmd>Telescope commands<CR>')
map('n', '<Leader>tq', '<cmd>Telescope quickfix<CR>')
map('n', '<Leader>tl', '<cmd>Telescope loclist<CR>')
map('n', '<Leader>tn', '<cmd>Telescope notify<CR>')
map('n', '<Leader>tr', '<cmd>Telescope registers<CR>')
map('n', '<Leader>tgc', '<cmd>Telescope git_commits<CR>')
map('n', '<Leader>tgb', '<cmd>Telescope git_branches<CR>')
map('n', '<Leader>tgs', '<cmd>Telescope git_status<CR>')
