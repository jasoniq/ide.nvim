-- Tree-sitter parser manager for Neovim 0.12+.
--
-- Neovim 0.12 ships Tree-sitter in core but does not include a parser
-- installer. nvim-treesitter is now archived, so we use
-- tree-sitter-manager.nvim to install/update parsers and copy queries.
--
-- Add language parsers via the `ensure_installed` list below, or install them
-- interactively from the `:TSManager` UI.
--
-- Requirements:
--   * Neovim 0.12+
--   * tree-sitter CLI on $PATH
--   * git
--   * a C compiler (gcc/clang)

return {
  {
    "romus204/tree-sitter-manager.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
    cmd = "TSManager",
    opts = {
      -- Parsers to install on first launch. Leave empty for a minimal setup.
      ensure_installed = {
        -- e.g. "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline",
      },
      -- Auto-install missing parsers when editing a new filetype
      auto_install = false,
      -- Treesitter highlighting on by default for installed parsers
      highlight = true,
      -- Border style for the TSManager window (nil → use 'winborder')
      border = nil,
    },
    config = function(_, opts)
      require("tree-sitter-manager").setup(opts)
      -- NOTE: Neovim core treesitter does not (yet) ship an indent expression.
      -- Indentation falls back to the built-in filetype indent plugins. If you
      -- want treesitter-based indentation, install a dedicated plugin.
    end,
  },

  -- Auto close/rename HTML/JSX-style tags using the core treesitter API
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
