return {
  -- Mason for managing LSP servers, linters, formatters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        -- Language servers will be installed based on user preference
        -- No servers installed by default to keep minimal
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason-lspconfig for automatic LSP server setup
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      -- Enable automatic installation and setup for better user experience
      automatic_installation = true,
      ensure_installed = {
        "lua_ls", -- Include lua_ls for Neovim config development
      },
    },
  },
}
