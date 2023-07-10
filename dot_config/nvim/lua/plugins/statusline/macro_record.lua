-- MacroRecord
return {
  condition = function()
    return vim.fn.reg_recording() ~= ''
  end,

  hl = { fg = 'red' },

  provider = function()
    return ' ' .. vim.fn.reg_recording()
  end,

  update = {
    'RecordingEnter',
    'RecordingLeave',
  },
}
