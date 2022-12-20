local conditions = require('heirline.conditions')

--TerminalName
return {
  init = function(self)
    self.terminal_name, _ = vim.api.nvim_buf_get_name(0):gsub('.*:', '')
  end,

  hl = function()
    if conditions.is_active() then
      return { bg = 'fill', fg = 'green', bold = true }
    else
      return { bg = 'fill', fg = 'black' }
    end
  end,

  -- child: icon
  {
    hl = function()
      if conditions.is_active() then
        return { bg = 'green', fg = 'fill' }
      -- else
      --   return { bg = 'fill', fg = 'black' }
      end
    end,

    provider = function(self)
      -- if conditions.is_active() then
        return '  '
      -- else
      --   return '  '
      -- end
    end,
  },

  -- child: separator
  {
    provider = function(self)
      if conditions.is_active() then
        return ''
      else
        return ''
      end
    end
  },

  -- child: terminal name
  {
    provider = function(self)
      -- return '    ' .. self.terminal_name
      return ' ' .. self.terminal_name
    end
  },
}
