local map = vim.api.nvim_set_keymap
opts = { noremap = true }

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

-- Compe Mappings (auto-completion)
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  else
    return t '<S-Tab>'
  end
end

map('i', '<C-e>', 'compe#close("<C-e>")', { expr = true, silent = true })
map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', "<S-Tab>", 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
