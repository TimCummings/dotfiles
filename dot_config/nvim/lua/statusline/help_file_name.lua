local conditions = require('heirline.conditions')

-- HelpFileName
return {
  condition = function()
    return vim.bo.filetype == 'help'
  end,

  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,

  hl = function()
    if conditions.is_active() then
      return { bg = 'fill', fg = 'dark_white' }
    else
      return { fg = 'black' }
    end
  end,

  provider = function(self)
    return ' ' .. vim.fn.fnamemodify(self.filename, ':t') .. ' '
  end,

  -- child: separator
  -- {
  --   condition = function()
  --     return conditions.is_active()
  --   end,
  --
  --   hl = { bg = 'fill', fg = 'background' },
  --   provider = '',
  -- },
}
