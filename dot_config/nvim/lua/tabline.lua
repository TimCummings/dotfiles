-- code derived significantly from https://github.com/alvarosevilla95/luatab.nvim

local function highlight(name, foreground, background)
  local command = {'highlight', name}
  if foreground and foreground ~= 'none' then
    table.insert(command, 'guifg=' .. foreground)
  end
  if background and background ~= 'none' then
    table.insert(command, 'guibg=' .. background)
  end
  vim.cmd(table.concat(command, ' '))
end

local function create_component_highlight_group(color, highlight_tag)
  if color.bg and color.fg then
    local highlight_group_name = table.concat({'luatab', highlight_tag}, '_')
    highlight(highlight_group_name, color.fg, color.bg)
    return highlight_group_name
  end
end

local function extract_highlight_colors (color_group, scope)
  if vim.fn.hlexists(color_group) == 0 then return nil end
  local color = vim.api.nvim_get_hl_by_name(color_group, true)
  if color.background ~= nil then
    color.bg = string.format('#%06x', color.background)
    color.background = nil
  end
  if color.foreground ~= nil then
    color.fg = string.format('#%06x', color.foreground)
    color.foreground = nil
  end
  if scope then return color[scope] end
  return color
end

local function tabName(bufnr)
  local file = vim.fn.bufname(bufnr)
  local buftype = vim.fn.getbufvar(bufnr, '&buftype')
  local filetype = vim.fn.getbufvar(bufnr, '&filetype')
  if buftype == 'help' then
    return 'help:' .. vim.fn.fnamemodify(file, ':t:r')
  elseif buftype == 'quickfix' then
    return 'quickfix'
  elseif filetype == 'TelescopePrompt' then
    return 'Telescope'
  elseif file:sub(file:len()-2, file:len()) == 'FZF' then
    return 'FZF'
  elseif buftype == 'terminal' then
    return 'zsh'
  elseif file == '' then
    return '[No Name]'
  end
  return vim.fn.pathshorten(vim.fn.fnamemodify(file, ':p:~:t'))
end

local function tabModified(bufnr, isSelected)
  if vim.fn.getbufvar(bufnr, '&modified') == 1 then
    if isSelected then
      return '%#TabLineWarn#樂'
    else
      return '%#TabLine#樂'
    end
  else
    return ''
  end
end

local function tabWindowCount(current)
  local nwins = vim.fn.tabpagewinnr(current, '$')
  return nwins > 1 and '(' .. nwins .. ') ' or ''
end

local function tabDevicon(bufnr, isSelected)
  local dev, devhl
  local file = vim.fn.bufname(bufnr)
  local buftype = vim.fn.getbufvar(bufnr, '&buftype')
  local filetype = vim.fn.getbufvar(bufnr, '&filetype')
  if filetype == 'TelescopePrompt' then
    dev, devhl = require('nvim-web-devicons').get_icon('telescope')
  elseif filetype == 'fugitive' then
    dev, devhl = require('nvim-web-devicons').get_icon('git')
  elseif filetype == 'vimwiki' then
    dev, devhl = require('nvim-web-devicons').get_icon('markdown')
  elseif buftype == 'terminal' then
    dev, devhl = require('nvim-web-devicons').get_icon('zsh')
  else
    dev, devhl = require('nvim-web-devicons').get_icon(file, vim.fn.getbufvar(bufnr, '&filetype'))
  end
  if dev then
    local fg = extract_highlight_colors(devhl, 'fg')
    local bg = extract_highlight_colors('TabLineSel', 'bg')
    local hl = create_component_highlight_group({bg = bg, fg = fg}, devhl)
    return (isSelected and '%#'..hl..'#' or '') .. dev .. (isSelected and '%#TabLineSel#' or '') .. ' '
  end
  return ''
end

local function tabSeparator(current)
  return (current < vim.fn.tabpagenr('$') and '%#TabLine# ' or '')
end

local function decoration(current, isSelected, side)
  local hl
  local char

  if isSelected then
    hl = '%#TabLineFillInvert#'
    if side == 'left' then
      char = ' '
    elseif side == 'right' then
      char = ' '
    end
  else
    hl = '%#TabLine#'
    if side == 'left' then
      char = ' '
    elseif side == 'right' then
      char = ' '
    end
  end

  return hl .. char
end

local function formatTab(current)
  local isSelected = vim.fn.tabpagenr() == current
  local buflist = vim.fn.tabpagebuflist(current)
  local winnr = vim.fn.tabpagewinnr(current)
  local bufnr = buflist[winnr]
  local hl = (isSelected and '%#TabLineSel#' or '%#TabLine#')

  return decoration(current, isSelected, 'left') ..
    hl .. ' ' ..
    tabWindowCount(current) ..
    tabName(bufnr) .. ' ' ..
    tabDevicon(bufnr, isSelected) ..
    tabModified(bufnr, isSelected) ..
    decoration(current, isSelected, 'right') ..
    tabSeparator(current)
end

local function tabline()
  local i = 1
  local line = ''
  while i <= vim.fn.tabpagenr('$') do
    line = line .. formatTab(i)
    i = i + 1
  end
  return  line .. '%T%#TabLineFill#%='
end

Tabline = function()
  local i = 1
  local line = ''
  while i <= vim.fn.tabpagenr('$') do
    line = line .. formatTab(i)
    i = i + 1
  end
  return  line .. '%T%#TabLineFill#%='
end

vim.cmd[[ set tabline=%!luaeval('Tabline()') ]]
