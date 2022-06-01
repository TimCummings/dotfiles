local M = {}

function M.setup()
  require('orgmode').setup({
    org_agenda_files = { '~/Documents/org/*' },
    org_default_notes_file = '~/Documents/org/refile.org',
    win_split_mode = 'float',
  })
end

return M
