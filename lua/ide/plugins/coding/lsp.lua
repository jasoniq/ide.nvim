return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Enhanced capabilities with completion support
    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities())

    -- Default LSP server configurations
    local default_server_configs = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (LuaJIT for Neovim)
              version = "LuaJIT",
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              disable = { "missing-fields" },
              -- Recognize the `vim` global and other Neovim-specific globals
              globals = {
                "vim",
                -- Add other common Neovim globals if needed
                "it",
                "describe",
                "before_each",
                "after_each", -- for testing
              },
            },
          },
        },
      },
      -- Add more default server configs as needed
    }

    -- On attach function for LSP servers
    local function on_attach(_, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end

    -- Configure shared defaults for all LSP servers
    local default_lsp_config = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Apply defaults and server-specific overrides using native Nvim 0.11 LSP APIs.
    vim.lsp.config("*", default_lsp_config)
    vim.lsp.config("lua_ls", default_server_configs.lua_ls or {})

    local border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.HINT] = "⚑",
          [vim.diagnostic.severity.INFO] = "»",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
