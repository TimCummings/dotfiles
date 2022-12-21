local protected_require = require('utils').protected_require

protected_require('notify', {
  background_colour = '#2e3440',
  -- level = 'trace',   -- minimum level of notifications to display; default is info
  stages = 'slide',
})
