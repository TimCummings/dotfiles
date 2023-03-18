local conditions = require('heirline.conditions')

-- FileNameBlock
return {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,

  hl = { bg = 'background', fg = 'dark_white' },

  -- child component: FileName
  {
    provider = function(self)
      -- first, trim the pattern relative to the current directory. For other
      -- options, see :h filename-modifers
      local filename = vim.fn.fnamemodify(self.filename, ':.')

      if filename == '' then return ' [No Name] ' end
      -- now, if the filename would occupy more than X% of the available
      -- space, we trim the file path to its initials
      -- See Flexible Components section below for dynamic truncation
      if not conditions.width_percent_below(#filename, 0.55) then
        filename = vim.fn.pathshorten(filename)
      end
      return ' ' .. filename .. ' '
    end,

    -- child: FileFlags
    {
      hl = { fg = 'dark_yellow' },

      {
        condition = function()
          return vim.bo.modified
        end,

        provider = '✶ ',
      },

      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,

        provider = ' ',
      },
    },

    -- child: separator
    {
      condition = function()
        return conditions.is_active()
      end,

      hl = { bg = 'fill', fg = 'background' },
      provider = '',
    },
  },

  { provider = '%<' } -- this means that the statusline is cut here when there's not enough space
}
