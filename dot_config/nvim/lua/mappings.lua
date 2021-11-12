local map = vim.api.nvim_set_keymap
opts = { noremap = true }

-- center screen after searching
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- move lines easily
map('n', '<C-j>', '<esc>:m .+1<CR>==', opts)
map('n', '<C-k>', '<esc>:m .-2<CR>==', opts)
map('v', '<C-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<C-k>', ":m '<-2<CR>gv=gv", opts)

-- Leader Key Mappings
map('', '<Leader>y', '"+y', opts)
map('', '<Leader>h', ':noh<CR>', opts)
map('', '<Leader>rl', ':set rnu!<CR>', opts)
map('i', '<Leader><Tab>', '<C-X><C-O>', opts)
map('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', opts)
map('n', '<Leader>n', '<cmd>NnnPicker<CR>', opts)

-- Telescope Mappings
map('n', '<Leader>tf', '<cmd>Telescope find_files<CR>', opts)
map('n', '<Leader>tb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<Leader>tc', '<cmd>Telescope commands<CR>', opts)
map('n', '<Leader>tq', '<cmd>Telescope quickfix<CR>', opts)
map('n', '<Leader>tl', '<cmd>Telescope loclist<CR>', opts)
map('n', '<Leader>tr', '<cmd>Telescope registers<CR>', opts)
map('n', '<Leader>tgc', '<cmd>Telescope git_commits<CR>', opts)
map('n', '<Leader>tgb', '<cmd>Telescope git_branches<CR>', opts)
map('n', '<Leader>tgs', '<cmd>Telescope git_status<CR>', opts)
