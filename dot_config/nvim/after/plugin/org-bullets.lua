local protected_require = require('utils').protected_require

protected_require('org-bullets', {
  symbols = {
    checkboxes = {
      half = { '◯', 'OrgTSCheckboxHalfChecked' },
      done = { '✓', 'OrgDONE' },
      todo = { '✗', 'OrgTODO' },
    },
    headlines = { '◆', '◇', '●', '◯', '▶', '▷' },
  }
})
