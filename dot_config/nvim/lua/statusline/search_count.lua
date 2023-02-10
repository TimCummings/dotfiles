-- SearchCount
return {
  condition = function()
    return vim.v.hlsearch == 1
  end,

  hl = { bg = 'dark_black', fg = 'dark_yellow' },

  -- child: icon
  { provider = ' ' },

  -- child: search_count
  {
    init = function(self)
      self.search_count = vim.fn.searchcount()
    end,

    provider = function(self)
      return ' ' .. (self.search_count['current'] or '0') .. '/' .. (self.search_count['total'] or '0')
    end,
  },
}
