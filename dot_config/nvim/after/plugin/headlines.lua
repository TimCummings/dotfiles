local protected_require = require('utils').protected_require

protected_require('headlines', {
  markdown = { dash_string = '─' },

  org = {
    fat_headlines = false,
    dash_string = '─',
    -- I don't completely understand why this works and some alternatives don't (and result
    -- in odd highlight behavior); be careful about changing this and check both .org
    -- and .md examples before discarding the original config
    headline_highlights = { 'Headline1' },
  },
})
