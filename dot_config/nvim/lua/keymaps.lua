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

wk.register({
  ['<Leader>i'] = {
    name = 'Insert...',
    d = { 'a<C-R>=strftime("<%Y-%m-%d %a>")<CR><Esc>', 'Date' },
    t = { 'a<C-R>=strftime("<%Y-%m-%d %a %X %Z>")<CR><Esc>', 'Timestamp' },
  },
})

-- Plugin Keymaps
vim.keymap.set('n', '<Leader>ct', '<cmd>ColorizerToggle<CR>', { desc = 'toggle Colorizer plugin' })

wk.register({
  ['<Leader>n'] = {
    name = 'Nnn...',
    e = { '<cmd>NnnExplorer<CR>', 'Explorer' },
    p = { '<cmd>NnnPicker<CR>', 'Picker' },
  },
})

wk.register({ ['<Leader>o'] = { name = 'Orgmode...' }})

-- Telescope
wk.register({
  ['<Leader>f'] = {
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
  ['<Leader>f"'] = { '<cmd>Telescope registers<CR>', 'Registers' },
})

vim.keymap.set('n', '<Leader>q', '<cmd>TroubleToggle document_diagnostics<CR>', { desc = 'Trouble' })
