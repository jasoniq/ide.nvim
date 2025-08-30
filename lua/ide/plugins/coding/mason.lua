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
      -- Install servers but don't auto-configure them (we handle configuration manually)
      automatic_installation = false,
      automatic_enable = false, -- Disable auto-setup, we'll configure manually
      ensure_installed = {
        "lua_ls", -- Include lua_ls for Neovim config development
      },
    },
  },
}
