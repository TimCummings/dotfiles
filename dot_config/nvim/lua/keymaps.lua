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

wk.register({
  ['<Leader>i'] = {
    name = 'Insert...',
    d = { 'a<C-R>=strftime("<%Y-%m-%d %a>")<CR><Esc>', 'Date' },
    t = { 'a<C-R>=strftime("<%Y-%m-%d %a %X %Z>")<CR><Esc>', 'Timestamp' },
  },
})


-- Plugin Keymaps
-----------------

-- Buffer Manager
wk.register({ ['<Leader>b'] = { require('buffer_manager.ui').toggle_quick_menu, 'Buffer Manager' }})

-- Colorizer
vim.keymap.set('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { desc = 'toggle Colorizer plugin' })

-- Navigator
local modes = { 'i', 'n', 't', 'v' }
vim.keymap.set(modes, '<M-h>', require('Navigator').left, { desc = 'Navigator Left' })
vim.keymap.set(modes, '<M-l>', require('Navigator').right, { desc = 'Navigator Right' })
vim.keymap.set(modes, '<M-k>', require('Navigator').up, { desc = 'Navigator Up' })
vim.keymap.set(modes, '<M-j>', require('Navigator').down, { desc = 'Navigator Down' })

-- Nnn file explorer
wk.register({['<Leader>E'] = { '<cmd>NnnExplorer<CR>', 'Nnn Explorer' }})
wk.register({['<Leader>e'] = { '<cmd>NnnPicker<CR>', 'Nnn Picker' }})
wk.register({['<Leader>F'] = { '<cmd>NnnPicker %:p:h<CR>', 'Sibling Files' }})

-- Orgmode
wk.register({['<Leader>o'] = { name = 'Orgmode...' }})

-- Telescope
wk.register({['<Leader>f'] = { '<cmd>Telescope find_files<CR>', 'find Files' }})
wk.register({
  ['<Leader>t'] = {
    name = 'Find...',
    f = { '<cmd>Telescope find_files<CR>', 'Files' },
    r = { '<cmd>Telescope live_grep<CR>', 'Grep' },
    b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
    c = { '<cmd>Telescope commands<CR>', 'Commands' },
    h = { '<cmd>Telescope highlights<CR>', 'Highlights' },
    k = { '<cmd>Telescope keymaps<CR>', 'Keymaps' },
    l = { '<cmd>Telescope loclist<CR>', 'Loclist' },
    n = { '<cmd>Telescope notify<CR>', 'Notifications' },
    q = { '<cmd>Telescope quickfix<CR>', 'Quickfix' },
    g = {
      name = 'Git...',
      c = { '<cmd>Telescope git_commits<CR>', 'Commits' },
      b = { '<cmd>Telescope git_branches<CR>', 'Branches' },
      s = { '<cmd>Telescope git_status<CR>', 'Status' },
    },
  },

  -- have to use different syntax to map to `"`
  ['<Leader>t"'] = { '<cmd>Telescope registers<CR>', 'Registers' },
})

-- Trouble
vim.keymap.set('n', '<Leader>q', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Trouble' })
