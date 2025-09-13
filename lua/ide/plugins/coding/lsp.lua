return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- LSP configuration is now handled via lazy.nvim overrides

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Configure LSP UI with borders (modern approach)
    require("lspconfig.ui.windows").default_options.border = "rounded"

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
    local function on_attach(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end

    -- Configure default settings for all LSP servers
    -- Mason will automatically start installed servers, and they'll use these defaults
    local default_lsp_config = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Set up specific server configurations
    -- lua_ls with our enhanced Neovim configuration
    lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_lsp_config, default_server_configs.lua_ls or {}))

    -- Mason-lspconfig will automatically set up installed servers
    -- Since automatic_installation = true, mason will handle server setup with lspconfig defaults

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
