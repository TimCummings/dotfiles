-- colorscheme settings (supported by nord colorscheme plugin)
vim.o.termguicolors = true

-- autogroup with autocommands for tweaking highlights
local colorscheme_group = vim.api.nvim_create_augroup('Colorscheme', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
    group = colorscheme_group,
    desc = 'set colorscheme and custom highlights',
    callback = function()
      -- general
      vim.api.nvim_set_hl(0, 'Title', { fg = '#5E81AC', bold = true }) -- nord10
      vim.api.nvim_set_hl(0, 'Constant', { bold = true })
      vim.api.nvim_set_hl(0, 'NonText', { fg = '#565575' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { fg = '#a3be8c', bold = true })
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#81a1c1', bold = true })

      -- statusline: mostly Challenger Deep with some Nord-esque
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#100E23', fg = '#A6B3CC' })
      vim.api.nvim_set_hl(0, 'StatusLineFill', { bg = '#100E23', fg = '#CBE3E7' })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#100E23', fg = '#565575' })
      vim.api.nvim_set_hl(0, 'StatusLineSpecial', { bg = '#100E23', fg = '#81A1C1' })
      vim.api.nvim_set_hl(0, 'StatusLineRuler', { bg = '#272638', fg = '#A6B3CC' })
      vim.api.nvim_set_hl(0, 'StatusLineSeparator', { bg = '#100E23', fg = '#272638' })

      -- tabline
      vim.api.nvim_set_hl(0, 'TabLine', { bg = '#100e23', fg = '#565575' })
      vim.api.nvim_set_hl(0, 'TabLineSel', { bg = '#272638', fg = '#63f2f1' })
      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = '#100e23', fg = '#272638' })
      vim.api.nvim_set_hl(0, 'TabLineFillInvert', { bg = '#272638', fg = '#100e23' })
      vim.api.nvim_set_hl(0, 'TabLineWarn', { bg = '#272638', fg = '#ffb378' })

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
      -- override match highlighting (links to `Search` by default, which is hard to read)
      vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = '#88c0d0' })

      -- Restore Notify defaults (Nord colorscheme got too aggressive in its broad support)
      vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = '#8A1F1F' })
      vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = '#4F6752' })
      vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = '#79491D' })
      vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = '#8B8B8B' })
      vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = '#4F3552' })
      vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = '#F70067' })
      vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = '#F79000' })
      vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = '#A9FF68' })
      vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = '#8B8B8B' })
      vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = '#D484FF' })
      vim.api.nvim_set_hl(0, 'NotifyERRORTitle',  { fg = '#F70067' })
      vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = '#F79000' })
      vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = '#A9FF68' })
      vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle',  { fg = '#8B8B8B' })
      vim.api.nvim_set_hl(0, 'NotifyTRACETitle',  { fg = '#D484FF' })

      -- NvimTree file explorer plugin
      vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = '#63f2f1' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = '#00aeff' })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = '#00aeff' })

      -- Org Mode
      vim.api.nvim_set_hl(0, 'OrgHeadlineLevel1', { fg = '#5E81AC', bold = true }) -- nord10
      vim.api.nvim_set_hl(0, 'OrgHeadlineLevel2', { fg = '#81A1C1', bold = true }) -- nord9
      vim.api.nvim_set_hl(0, 'OrgHeadlineLevel3', { fg = '#88C0D0', bold = true }) -- nord8
      vim.api.nvim_set_hl(0, 'OrgHeadlineLevel4', { fg = '#5E81AC', bold = true }) -- nord10
      vim.api.nvim_set_hl(0, 'OrgHeadlineLevel5', { fg = '#81A1C1', bold = true }) -- nord9
      vim.api.nvim_set_hl(0, 'OrgHeadlineLevel6', { fg = '#88C0D0', bold = true }) -- nord8
      vim.api.nvim_set_hl(0, 'OrgTSPlan', { fg = '#B48EAD' }) -- nord15
      vim.api.nvim_set_hl(0, 'OrgTSBullet', { fg = '#81A1C1', bold = true }) -- nord9
      vim.api.nvim_set_hl(0, 'OrgTODO', { fg = '#D08770', bold = true }) -- nord12
      vim.api.nvim_set_hl(0, 'OrgTSCheckboxHalfChecked', { fg = '#EBCB8B', bold = true }) -- nord13
      vim.api.nvim_set_hl(0, 'org_code', { bg = '#3B4252', fg = '#88C0D0' }) -- nord8
      vim.api.nvim_set_hl(0, 'org_verbatim', { fg = '#88C0D0' }) -- nord8
      vim.api.nvim_set_hl(0, 'org_hyperlink', { fg = '#8FBCBB', underline = true }) -- nord7
    end,
})
