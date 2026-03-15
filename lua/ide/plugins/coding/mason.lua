return {
  -- Mason for managing LSP servers, linters, formatters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
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
      -- Automatically enable installed servers via vim.lsp.enable().
      automatic_enable = true,
      ensure_installed = {
        "lua_ls", -- Include lua_ls for Neovim config development
      },
    },
  },
}
