-- Main plugin index that imports all organized plugin categories (LazyVim style)
return {
  -- IDE core configuration - runs setup automatically
  {
    "jasoniq/ide.nvim",
    name = "ide-core",
    priority = 1000,
    config = function()
      -- Auto-load essential IDE configuration
      require("ide.config.core.options").setup()
      require("ide.config.bindings.keymaps").setup()
    end,
  },

  -- Plugin categories
  { import = "ide.plugins.editor" },
  { import = "ide.plugins.coding" },
  { import = "ide.plugins.ui" },
  { import = "ide.plugins.util" },
}
