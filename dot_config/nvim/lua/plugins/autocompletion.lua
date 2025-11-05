-- TODO: customize list of results, especially their sources
return {
  {
    'hrsh7th/nvim-cmp',

    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },

        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          -- ['<CR>'] = cmp.mapping.confirm {
            --   behavior = cmp.ConfirmBehavior.Replace,
            --   select = true,
            -- },
            ['<Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end,
            ['<S-Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end,
          },

          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
          }, {
            { name = 'buffer' },
            { name = 'nvim_lua' },
          }),

          window = {
            -- completion uses the "Pmenu" highlight group and is fine as-is
            documentation = cmp.config.window.bordered({
              border = 'none',
              side_padding = 4, -- this doesn't appear to be working
              winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:None',
            }),
          },
        })
      end,
    },

  { 'hrsh7th/cmp-nvim-lsp' },
  -- { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' }, -- TODO: does this work???
  { 'hrsh7th/cmp-nvim-lua' },
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    version = 'v2.*',
  },
}
