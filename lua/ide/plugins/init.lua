-- Get config for conditional plugin loading
local config = require("ide.config")
local features = config.features or {}

-- Build plugin list with conditional imports
local plugins = {
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

  -- Core plugins (always enabled)
  { import = "ide.plugins.editor.vim-tmux-navigator" },
  { import = "ide.plugins.ui.snacks" },
  { import = "ide.plugins.ui.colorscheme" },
}

-- Conditional plugin imports based on feature flags
if features.finder ~= false then
  table.insert(plugins, { import = "ide.plugins.util.telescope" })
end

if features.keybind_help ~= false then
  table.insert(plugins, { import = "ide.plugins.ui.which-key" })
end

if features.syntax_highlighting ~= false then
  table.insert(plugins, { import = "ide.plugins.editor.treesitter" })
end

if features.statusline ~= false then
  table.insert(plugins, { import = "ide.plugins.ui.statusline" })
end

if features.lsp ~= false then
  table.insert(plugins, { import = "ide.plugins.coding.lsp" })
  table.insert(plugins, { import = "ide.plugins.coding.completion" })
  table.insert(plugins, { import = "ide.plugins.coding.mason" })
end

if features.refactoring ~= false then
  table.insert(plugins, { import = "ide.plugins.coding.refactoring" })
end

if features.debugging ~= false then
  table.insert(plugins, { import = "ide.plugins.coding.dap" })
end

return plugins
