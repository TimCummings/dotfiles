-- ViMode
return {
  -- Re-evaluate the component only on ModeChanged event!
  -- This is not required in any way, but it's there, and it's a small
  -- performance improvement.
  update = { 'ModeChanged' },

  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
    mode_names = {
      n = ' ' ,
      i = '󰙏 ',
      v = ' ',
      V = ' ',
      ['\22'] = ' ',
      c = ' ',
      s = '󰗧 ',
      S = '󰗧 ',
      ['\19'] = '󰗧 ',
      R = ' ',
      r = ' ',
      ['!'] = ' ',
      t = ' ',
    },

    mode_colors = {
      n = 'cyan' ,
      i = 'green',
      v = 'yellow',
      V = 'yellow',
      ['\22'] = 'yellow',
      c = 'yellow',
      s = 'purple',
      S = 'purple',
      ['\19'] = 'purple',
      R = 'red',
      r = 'red',
      ['!'] = 'red',
      t = 'purple',
    }
  },

  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()

    -- execute this only once, this is required if you want the ViMode
    -- component to be updated on operator pending mode
    if not self.once then
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*:*o',
        command = 'redrawstatus',
      })
      self.once = true
    end
  end,

  -- child: left separator
  {
    hl = function(self)
      local mode = self.mode:sub(1, 1)
      return { bg = 'dark_' .. self.mode_colors[mode], fg = 'background' }
    end,

    provider = ' ',
  },

  -- child: mode indicator
  {
    hl = function(self)
      -- get only the first mode character
      local mode = self.mode:sub(1, 1)
      return { bg = 'dark_' .. self.mode_colors[mode], fg = 'dark_black', bold = true, }
    end,

    -- We can now access the value of mode() that, by now, would have been
    -- computed by `init()` and use it to index our strings dictionary.
    -- note how `static` fields become just regular attributes once the
    -- component is instantiated.
    provider = function(self)
      -- get only the first mode character
      local mode = self.mode:sub(1, 1)
      return self.mode_names[mode]
    end,
  },

  -- child: separator
  {
    hl = function(self)
      local mode = self.mode:sub(1, 1)
      return { bg = 'background', fg = 'dark_' .. self.mode_colors[mode] }
    end,

    provider = '',
  },
}
