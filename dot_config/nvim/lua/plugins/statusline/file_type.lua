local conditions = require('heirline.conditions')

-- FileType
return {
  -- child: file type
  {
    hl = function()
      if conditions.is_active() then
        return { bg = 'dark_blue', fg = 'fill', bold = true }
      else
        return { bg = 'fill', fg = 'black', bold = true }
      end
    end,

    provider = function(self)
      return ' ' .. string.upper(vim.bo.filetype) .. ' '
    end,
  },

  -- child: right separator
  {
    hl = function()
      if conditions.is_active() then
        return { bg = 'fill', fg = 'dark_blue' }
      else
        return { bg = 'fill', fg = 'black' }
      end
    end,

    provider = function(self)
      if conditions.is_active() then
        return ''
      else
        return ''
      end
    end,
  },
}

