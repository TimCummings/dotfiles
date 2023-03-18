return {
  -- LSP Support
  -- TODO: fix LSP docs highlighting (e.g. when pressing `K` in normal over a function)
  -- TODO: thoroughly test all keymaps
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- use an on_attach function to only map the following keys after the language
      -- server attaches to the current buffer
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<Leader>wl', function()
        -- vim.inspect(vim.lsp.buf.list_workspace_folders())
        -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
      end

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = 'rounded'
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      require('mason-lspconfig').setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,
        -- Next, you can provide targeted overrides for specific servers.
        ['lua_ls'] = function ()
          require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          }
        end,
      })

      -- TODO: move to settings and review options
      -- Set completeopt to have a better completion experience
      vim.o.completeopt = 'menu,menuone,noselect'

      -- luasnip setup
      -- require('luasnip')

      -- nvim-cmp setup
      require('cmp')
    end,
  },

  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = 'single',
        icons = {
          package_installed = '✓ ',
          package_pending = '┄ ',
          package_uninstalled = '✗ '
        },
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'gopls', 'lua_ls', 'tsserver', 'yamlls' },
    },
  },
}
