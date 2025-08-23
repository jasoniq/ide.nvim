local config = require("ide.config")

-- Only return the plugin if lsp feature is enabled
if not config.features.lsp then
  return {}
end

return {
  -- Mason for managing LSP servers, linters, formatters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    config = function()
      -- Get user configuration for mason
      local user_config = config.plugins.mason or {}
      
      local default_config = {
        ensure_installed = {
          -- Language servers will be installed based on user preference
          -- No servers installed by default to keep minimal
        },
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      }

      local final_config = vim.tbl_deep_extend("force", default_config, user_config)
      require("mason").setup(final_config)
    end,
  },

  -- Mason-lspconfig for automatic LSP server setup
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      local user_config = config.plugins.mason_lspconfig or {}
      
      local default_config = {
        -- Automatically install language servers based on installed languages
        automatic_installation = false,
        ensure_installed = {
          -- No servers installed by default - users add what they need
        },
      }

      local final_config = vim.tbl_deep_extend("force", default_config, user_config)
      require("mason-lspconfig").setup(final_config)
    end,
  },
}