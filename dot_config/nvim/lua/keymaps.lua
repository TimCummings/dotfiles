local wk = require('which-key')

vim.keymap.set('n', '<Esc>', function()
  vim.cmd.nohlsearch()
  vim.cmd.echo()
  pcall(function() require('notify').dismiss() end)
end, { desc = 'clear highlights, short-message, and notifications', silent = true })

vim.keymap.set('n', 'n', 'nzz', { desc = 'center screen after search' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'center screen after search' })

-- move lines easily
vim.keymap.set('n', '<C-j>', '<esc>:m .+1<CR>==', { desc = 'move line down', silent = true })
vim.keymap.set('n', '<C-k>', '<esc>:m .-2<CR>==', { desc = 'move line up', silent = true })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'move lines down', silent = true })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'move lines up', silent = true })


-- Leader Key Mappings
----------------------

vim.keymap.set('n', '<Leader>.', function()
  vim.api.nvim_exec(
    [[
    redir @+>
    echo expand('%:p')
    redir END
    ]],
    false
  )
end, { desc = 'yank full file path' })
vim.keymap.set('', '<Leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<Leader>d', '"_d', { desc = 'Delete without overwriting register' })
vim.keymap.set('v', '<Leader>d', '"_d', { desc = 'Delete without overwriting register' })
vim.keymap.set('x', '<Leader>p', '"_dp', { desc = 'Paste after without overwriting register' })
vim.keymap.set('x', '<Leader>P', '"_dP', { desc = 'Paste before without overwriting register' })
vim.keymap.set('n', '<Leader>rl', ':set rnu!<CR>', { desc = 'toggle relative line numbers', silent = true })
vim.keymap.set('n', '<Leader>ni', ':Inspect<CR>', { desc = ':Inspect' })
vim.keymap.set('n', '<Leader>nt', ':InspectTree<CR>', { desc = ':InspectTree' })

wk.add({
  { '<Leader>i', group = 'Insert...' },
  { '<Leader>id', 'a<C-R>=strftime("<%Y-%m-%d %a>")<CR><Esc>', desc = 'Date' },
  { '<Leader>it', 'a<C-R>=strftime("<%Y-%m-%d %a %X %Z>")<CR><Esc>', desc = 'Timestamp' },
})


-- Plugin Keymaps
-----------------

-- Buffer Manager
wk.add({ '<Leader>b', require('buffer_manager.ui').toggle_quick_menu, desc = 'Buffer Manager' })

-- Colorizer
vim.keymap.set('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { desc = 'toggle Colorizer plugin' })

-- Nnn file explorer
wk.add({
  { '<Leader>E', '<cmd>NnnExplorer<CR>', desc = 'Nnn Explorer' },
  { '<Leader>e', '<cmd>NnnPicker<CR>', desc = 'Nnn Picker' },
  { '<Leader>F', '<cmd>NnnPicker %:p:h<CR>', desc = 'Sibling Files' },
})

-- Smart Splits
local modes = { 'i', 'n', 't', 'v' }
vim.keymap.set(modes, '<M-k>', require('smart-splits').move_cursor_up, { desc = 'Smart Splits Up' })
vim.keymap.set(modes, '<M-l>', require('smart-splits').move_cursor_right, { desc = 'Smart Splits Right' })
vim.keymap.set(modes, '<M-j>', require('smart-splits').move_cursor_down, { desc = 'Smart Splits Down' })
vim.keymap.set(modes, '<M-h>', require('smart-splits').move_cursor_left, { desc = 'Smart Splits Left' })

-- Telescope
wk.add({
  { '<Leader>f', '<cmd>Telescope find_files<CR>', desc = 'find Files' },

  { '<Leader>t', group = 'Find...' },
  { '<Leader>t"', '<cmd>Telescope registers<CR>', desc = 'Registers' },
  { '<Leader>tb', '<cmd>Telescope buffers<CR>', desc = 'Buffers' },
  { '<Leader>tc', '<cmd>Telescope commands<CR>', desc = 'Commands' },
  { '<Leader>tf', '<cmd>Telescope find_files<CR>', desc = 'Files' },
  { '<Leader>th', '<cmd>Telescope highlights<CR>', desc = 'Highlights' },
  { '<Leader>tk', '<cmd>Telescope keymaps<CR>', desc = 'Keymaps' },
  { '<Leader>tl', '<cmd>Telescope loclist<CR>', desc = 'Loclist' },
  { '<Leader>tn', '<cmd>Telescope notify<CR>', desc = 'Notifications' },
  { '<Leader>tq', '<cmd>Telescope quickfix<CR>', desc = 'Quickfix' },
  { '<Leader>tr', '<cmd>Telescope live_grep<CR>', desc = 'Grep' },

  { '<Leader>tg', group = 'Git...' },
  { '<Leader>tgb', '<cmd>Telescope git_branches<CR>', desc = 'Branches' },
  { '<Leader>tgc', '<cmd>Telescope git_commits<CR>', desc = 'Commits' },
  { '<Leader>tgs', '<cmd>Telescope git_status<CR>', desc = 'Status' },
})

-- Trouble
vim.keymap.set('n', '<Leader>q', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Trouble' })
