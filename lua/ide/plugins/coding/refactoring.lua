return {
  -- refactoring.nvim's Neovim 0.12+ rewrite replaced plenary with async.nvim.
  -- Declared as a top-level non-lazy spec so lazy.nvim always installs and
  -- loads it, regardless of refactoring.nvim's keys-lazy state.
  {
    "lewis6991/async.nvim",
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "lewis6991/async.nvim",
      -- Tree-sitter parsers/queries come from the core 0.12 runtime, managed by
      -- tree-sitter-manager.nvim (see lua/ide/plugins/editor/treesitter.lua).
    },
    keys = {
      { "<leader>re", desc = "Extract Function" },
      { "<leader>rv", desc = "Extract Variable" },
      { "<leader>ri", desc = "Inline Variable" },
      { "<leader>rr", desc = "Refactor Menu" },
    },
    opts = {
      prompt_func_return_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
      show_success_message = true,
    },
    config = function(_, opts)
      require("refactoring").setup(opts)

      -- Telescope integration (always load since refactoring is conditional on finder)
      pcall(require("telescope").load_extension, "refactoring")
    end,
  },
}
