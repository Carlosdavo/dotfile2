return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', '<leader>k', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end,
    })

    -- Mason setup
    require("mason").setup({
      ensure_installed = {
      },
    })

    -- Mason-lspconfig setup
    require("mason-lspconfig").setup({
      handlers = {
        -- Default handler para servidores instalados automáticamente
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- Handler personalizado para rust-analyzer
        rust_analyzer = function()
          require("lspconfig").rust_analyzer.setup({
            settings = {
              ['rust-analyzer'] = {
                cargo = {
                  allFeatures = true,  -- Habilita todas las features de Cargo
                  loadOutDirsFromCheck = true,
                },
                procMacro = {
                  enable = true,  -- Habilita expansión de macros procedurales
                },
                checkOnSave = {
                  command = "check",  -- Usa clippy en lugar de cargo check (más lints)
                },
                diagnostics = {
                  enable = true,
                  experimental = {
                    enable = true,
                  },
                },
                inlayHints = {
                  bindingModeHints = {
                    enable = true,
                  },
                  chainingHints = {
                    enable = true,
                  },
                  closingBraceHints = {
                    minLines = 10,
                  },
                  closureReturnTypeHints = {
                    enable = "with_block",
                  },
                  lifetimeElisionHints = {
                    enable = "skip_trivial",
                    useParameterNames = true,
                  },
                  typeHints = {
                    enable = true,
                  },
                },
              },
            },
          })
        end,
      },
    })

    local cmp = require("cmp")

    --   פּ ﯟ   some other good icons
    local kind_icons = {
      Text = "",
      Method = "m",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    cmp.setup({
      sources = {
        {name = "nvim_lsp"},
        { name = "buffer" },
        { name = "path" },
      },

     mapping = {
       ["<C-k>"] = cmp.mapping.select_prev_item(),
       ["<C-j>"] = cmp.mapping.select_next_item(),
       ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
       ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
       ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
       ["<C-y>"] = cmp.config.disable,
       ["<C-e>"] = cmp.mapping {
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
       },
       ["<CR>"] = cmp.mapping.confirm { select = false },
       ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
           cmp.select_next_item()
         else
           fallback()
         end
       end, {
         "i",
         "s",
       }),
       ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
           cmp.select_prev_item()
         else
           fallback()
         end
       end, {
         "i",
         "s",
       }),
     },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    }
  })
  end
}
