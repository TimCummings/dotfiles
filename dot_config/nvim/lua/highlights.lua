-- colorscheme settings (supported by nord colorscheme plugin)
vim.o.termguicolors = true
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = false
-- vim.g.onedark_style = 'dark'
-- vim.g.onedark_style = 'darker'
-- vim.g.onedark_style = 'cool'
--vim.g.onedark_style = 'deep'

-- autogroup with autocommands for tweaking highlights
local colorscheme_group = vim.api.nvim_create_augroup('Colorscheme', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
    group = colorscheme_group,
    desc = 'set colorscheme and custom highlights',
    callback = function()
      -- general
      vim.api.nvim_set_hl(0, 'NonText', { fg = '#565575' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { fg = '#a3be8c', bold = true })
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#a3be8c', bold = true })
      vim.api.nvim_set_hl(0, 'TabLine', { bg = '#100e23', fg = '#565575' })
      vim.api.nvim_set_hl(0, 'TabLineSel', { bg = '#272638', fg = '#63f2f1' })
      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = '#100e23', fg = '#272638' })
      vim.api.nvim_set_hl(0, 'TabLineFillInvert', { bg = '#272638', fg = '#100e23' })
      vim.api.nvim_set_hl(0, 'TabLineWarn', { bg = '#272638', fg = '#ffb378' })

      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#81a1c1', bold = true })

      -- diagnostics
      vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = '#f70067' })
      vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = '#d484ff' })
      vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = '#a9ff68' })
      vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = '#f79000' })

      -- Telescope plugin
      vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = '#7495ba', bold = true })
      vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = '#81a1c1' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#81a1c1' })
      vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = '#d7005f', bold = true })

      -- NvimTree file explorer plugin
      vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = '#63f2f1' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = '#00aeff' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = '#00aeff' })
    end,
})

-- LUA alternative wasn't triggering `ColorScheme` event
vim.cmd('colorscheme nord')
