-- SearchCount
return {
  condition = function()
    return vim.v.hlsearch ~= 0
  end,

  hl = { bg = 'dark_black', fg = 'dark_yellow' },

  -- child: icon
  { provider = ' ' },

  -- child: search_count
  {
    init = function(self)
      local ok, search_count = pcall(vim.fn.searchcount)
      if ok and search_count.total then
        self.search_count = search_count
      end
    end,

    provider = function(self)
      local search_count = self.search_count
      return string.format(' %d/%d', search_count.current, math.min(search_count.total, search_count.maxcount))
    end,
  },
}
