local config = require("ide.config")

-- Only load catppuccin plugin if colorscheme is "catppuccin" string or function
if config.colorscheme ~= "catppuccin" and type(config.colorscheme) ~= "function" then
  return {}
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- Get user configuration for catppuccin
    local user_config = config.plugins.catppuccin or {}
    
    local default_config = {}

    local final_config = vim.tbl_deep_extend("force", default_config, user_config)
    require("catppuccin").setup(final_config)
    
    -- Set colorscheme if it's explicitly "catppuccin" string
    -- Function-based colorschemes handle their own loading
    if config.colorscheme == "catppuccin" then
      vim.cmd.colorscheme("catppuccin")
    end
  end,
}