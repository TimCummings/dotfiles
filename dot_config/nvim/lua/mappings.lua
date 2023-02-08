-- center screen after searching
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- move lines easily
vim.keymap.set('n', '<C-j>', '<esc>:m .+1<CR>==', { silent = true })
vim.keymap.set('n', '<C-k>', '<esc>:m .-2<CR>==', { silent = true })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { silent = true })

-- Leader Key Mappings
vim.keymap.set('n', '<Leader>.', function()
  vim.api.nvim_exec(
    [[
    redir @+>
    echo expand('%:p')
    redir END
    ]],
    false
  )
end, { desc = 'yank full path of current file to system clipboard' })
vim.keymap.set('', '<Leader>y', '"+y', { desc = 'yank to system clipboard' })
vim.keymap.set('n', '<Leader>d', '"_d', { desc = 'delete without overwriting register' })
vim.keymap.set('v', '<Leader>d', '"_d', { desc = 'delete without overwriting register' })
vim.keymap.set('x', '<Leader>p', '"_dp', { desc = 'paste after without overwriting register' })
vim.keymap.set('x', '<Leader>P', '"_dP', { desc = 'paste before without overwriting register' })
vim.keymap.set('', '<Leader>rl', ':set rnu!<CR>', { desc = 'toggle relative line numbers', silent = true })
vim.keymap.set('n', '<Leader>e', '<cmd>NnnExplorer<CR>')
vim.keymap.set('n', '<Leader>n', '<cmd>NnnPicker<CR>')
vim.keymap.set('n', '<Leader>w', '<cmd>w<CR>', { desc = 'save file' })
vim.keymap.set('n', '<Leader>wq', '<cmd>wq<CR>', { desc = 'save file and quit' })
vim.keymap.set('n', '<Leader>q', '<cmd>q<CR>', { desc = 'quit' })
vim.keymap.set('n', '<Leader>Q', '<cmd>q!<CR>', { desc = 'quit without saving' })
vim.keymap.set('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { desc = 'toggle Colorizer plugin' })
vim.keymap.set('n', '<Leader>td', 'a<C-R>=strftime("<%Y-%m-%d %a>")<CR>', { desc = 'insert date', silent = true })
vim.keymap.set('n', '<Leader>ts', 'a<C-R>=strftime("<%Y-%m-%d %a %X %Z>")<CR>', { desc = 'insert timestamp', silent = true })

-- Diagnostics
vim.keymap.set('n', '<Leader>cd', '<cmd>Trouble document_diagnostics<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set('n', '<Esc>', function()
  vim.cmd.nohlsearch()
  vim.cmd.echo()
  pcall(function() require('notify').dismiss() end)
end, { desc = 'clear search highlights, short-message, and notifications', silent = true })

-- plugin specifc mappings: moved to their own files in `after` directory,
-- but copied here for comprehensive list of mappings

-- Telescope Mappings
-- vim.keymap.set('n', '<Leader>f', require('telescope.builtin').find_files)
-- vim.keymap.set('n', '<Leader>rg', require('telescope.builtin').live_grep)
-- vim.keymap.set('n', '<Leader>tb', require('telescope.builtin').buffers)
-- vim.keymap.set('n', '<Leader>tc', require('telescope.builtin').commands)
-- vim.keymap.set('n', '<Leader>tq', require('telescope.builtin').quickfix)
-- vim.keymap.set('n', '<Leader>tl', require('telescope.builtin').loclist)
-- vim.keymap.set('n', '<Leader>tn', require('telescope').extensions.notify.notify)
-- vim.keymap.set('n', '<Leader>tr', require('telescope.builtin').registers)
-- vim.keymap.set('n', '<Leader>tgc', require('telescope.builtin').git_commits)
-- vim.keymap.set('n', '<Leader>tgb', require('telescope.builtin').git_branches)
-- vim.keymap.set('n', '<Leader>tgs', require('telescope.builtin').git_status)
