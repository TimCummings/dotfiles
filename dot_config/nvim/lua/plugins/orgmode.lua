return {
  {
    'nvim-orgmode/orgmode',

    opts = {
      org_agenda_files = { '~/Documents/org/*' },
      org_agenda_start_on_weekday = 7,
      org_default_notes_file = '~/Documents/org/refile.org',
      org_hide_emphasis_markers = true,
      org_startup_folded = 'showeverything',
      win_split_mode = 'float',
      mappings = {
        agenda = {
          org_agenda_quit = { 'q', '<ESC>' }
        }
      }
    },
  },

  {
    'akinsho/org-bullets.nvim',

    opts = {
      symbols = {
        checkboxes = {
          half = { '◯', 'OrgTSCheckboxHalfChecked' },
          done = { '✓', 'OrgDONE' },
          todo = { '✗', 'OrgTODO' },
        },
        headlines = { '◆', '◇', '●', '◯', '▶', '▷' },
      }
    },

    ft = 'org',
    lazy = true,
  },

  {
    'lukas-reineke/headlines.nvim',

    config = function()
      require('headlines').setup({
        markdown = { dash_string = '─' },

        org = {
          dash_string = '─',
          fat_headlines = false,
          -- Headline highlights with Lazy was causing endless issues, just disable them.
          -- Maybe revisit when overhauling highlights, colorscheme autogroups, etc.
          headline_highlights = false,
        },
      })
    end,

    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = { 'markdown', 'org' },
    lazy = true,
  },
}
