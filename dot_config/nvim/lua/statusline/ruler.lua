-- Ruler
return {
  static = {
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
    },
  },

  init = function(self)
    self.mode = vim.fn.mode()
  end,

  hl = { bg = 'background', fg = 'dark_white' },

  -- child: left separator
  {
    hl = { bg = 'fill', fg = 'background' },
    provider = '',
  },

  -- child: row & column
    -- %l = current line number
    -- %c = column number
  { provider = ' %l:%c ' },

  -- child: delimiter
  -- { provider = '|' },
  { provider = '│' },

  -- child: progress percentage
  -- %P = percentage through file of displayed window
  {
    hl = { bg = 'background', fg = 'dark_white' },
    provider = ' %P '
  },

  -- child: right separator
  {
    hl = function(self)
      local mode = self.mode:sub(1, 1)
      -- return { bg = 'dark_black', fg = 'dark_' .. self.mode_colors[mode] }
      return { bg = 'dark_' .. self.mode_colors[mode] }
    end,

    provider = ' ',
    -- provider = '',
    -- provider = '',
  },
}
