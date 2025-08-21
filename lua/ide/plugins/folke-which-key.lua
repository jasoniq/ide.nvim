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
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }

    local final_config = vim.tbl_deep_extend("force", default_config, user_config)
    which_key.setup(final_config)
  end,
}