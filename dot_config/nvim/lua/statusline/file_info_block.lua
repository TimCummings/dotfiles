-- FileInfoBlock
return {
  -- this will *almost always* be "utf-8" & "unix" (or fenc may be empty in a new buffer);
  -- there's no reason to show these unless they are different
  condition = function()
    return (vim.bo.fenc ~= '' and vim.bo.fenc ~= 'utf-8') or vim.bo.fileformat ~= 'unix'
  end,

  -- only update on BufEnter event
  -- if fenc or fileformat are changed after a file is already open in a buffer,
  -- this can show an incorrect value until re-entering the buffer, but that
  -- scenario is unlikely
  update = 'BufEnter',

  hl = { bg = 'dark_red', fg = 'fill' },

  -- child: left separator
  {
    hl = { bg = 'fill', fg = 'dark_red' },
    -- provider = '',
    provider = '',
  },

  -- child: FileEncoding; ":h enc" & ":h fenc"
  {
    provider = function()
      return vim.bo.fenc:upper()
    end
  },

  -- child: middle separator
  { provider = ' | ' },

  -- child: FileFormat; ":h fileformat"
  {
    static = {
      symbols = {
        unix = ' ', -- e712
        dos  = ' ', -- e70f
        mac  = ' ', -- e711
      }
    },

    provider = function(self)
      local fmt = vim.bo.fileformat
      return self.symbols[fmt]
    end
  },

  -- child: right separator
  {
    hl = { bg = 'fill', fg = 'dark_red' },
    -- provider = '',
    provider = '',
  },
}
