local M = {}

function M.setup()
  require('orgmode').setup({
    org_agenda_files = { '~/Documents/org/*' },
    org_agenda_start_on_weekday = 7,
    org_default_notes_file = '~/Documents/org/refile.org',
    org_hide_emphasis_markers = true,
    win_split_mode = 'float',
    mappings = {
      agenda = {
        org_agenda_quit = { 'q', '<ESC>' }
      }
    }
  })
end

return M
