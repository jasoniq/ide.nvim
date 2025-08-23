local config = require("ide.config")

-- Only return the plugin if lsp feature is enabled
if not config.features.lsp then
  return {}
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Get user configuration for lspconfig
    local user_config = config.plugins.lspconfig or {}
    
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Setup LSP handlers
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    -- Enhanced capabilities with completion support
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities()
    )

    -- Default LSP server configurations
    local default_server_configs = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              disable = { "missing-fields" },
              globals = { "vim" },
            },
          },
        },
      },
      -- Add more default server configs as needed
    }

    -- On attach function for LSP servers
    local function on_attach(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- User-defined on_attach function
      if user_config.on_attach then
        user_config.on_attach(client, bufnr)
      end
    end

    -- Setup mason-lspconfig handlers
    mason_lspconfig.setup_handlers({
      -- Default handler for servers
      function(server_name)
        local server_config = vim.tbl_deep_extend(
          "force",
          {
            capabilities = capabilities,
            handlers = handlers,
            on_attach = on_attach,
          },
          default_server_configs[server_name] or {},
          user_config.servers and user_config.servers[server_name] or {}
        )
        
        lspconfig[server_name].setup(server_config)
      end,
    })

    -- Setup diagnostic signs
    local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      signs = true,
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