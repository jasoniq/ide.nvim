local config = require("ide.config")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    -- Get user configuration for snacks
    local user_config = config.plugins.snacks or {}
    
    local default_config = {
      bigfile = { enabled = true },
      dashboard = { enabled = true, example = "advanced" },
      explorer = { enabled = true },
    }

    local final_config = vim.tbl_deep_extend("force", default_config, user_config)
    require("snacks").setup(final_config)
  end,
}