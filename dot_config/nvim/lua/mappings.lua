function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- center screen after searching
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- move lines easily
map('n', '<C-j>', '<esc>:m .+1<CR>==')
map('n', '<C-k>', '<esc>:m .-2<CR>==')
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- Leader Key Mappings
map('', '<Leader>y', '"+y')
map('', '<Leader>h', ':noh<CR>')
map('', '<Leader>rl', ':set rnu!<CR>')
map('i', '<Leader><Tab>', '<C-X><C-O>')
map('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>')
map('n', '<Leader>n', '<cmd>NnnPicker<CR>')

-- Telescope Mappings
map('n', '<Leader>tf', '<cmd>Telescope find_files<CR>')
map('n', '<Leader>tb', '<cmd>Telescope buffers<CR>')
map('n', '<Leader>tc', '<cmd>Telescope commands<CR>')
map('n', '<Leader>tq', '<cmd>Telescope quickfix<CR>')
map('n', '<Leader>tl', '<cmd>Telescope loclist<CR>')
map('n', '<Leader>tn', '<cmd>Telescope notify<CR>')
map('n', '<Leader>tr', '<cmd>Telescope registers<CR>')
map('n', '<Leader>tgc', '<cmd>Telescope git_commits<CR>')
map('n', '<Leader>tgb', '<cmd>Telescope git_branches<CR>')
map('n', '<Leader>tgs', '<cmd>Telescope git_status<CR>')
