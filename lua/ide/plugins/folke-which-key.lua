local config = require("ide.config")

-- Only return the plugin if which_key feature is enabled
if not config.features.which_key then
  return {}
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local which_key = require("which-key")
    
    -- Get user configuration for which-key
    local user_config = config.plugins.which_key or {}
    
    local default_config = {
      preset = "modern",
      delay = 300,
    }

    local final_config = vim.tbl_deep_extend("force", default_config, user_config)
    which_key.setup(final_config)

    -- Register group names for organized display
    which_key.add({
      { "<leader>f", group = "Find", icon = "🔍" },
      { "<leader>g", group = "Git", icon = "🌿" },
      { "<leader>b", group = "Buffer", icon = "📄" },
      { "<leader>w", group = "Window", icon = "🪟" },
      { "<leader>t", group = "Treesitter", icon = "🌳" },
      { "<leader>c", group = "Code", icon = "💻" },
    })
  end,
}