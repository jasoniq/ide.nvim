vim.uv = vim.uv or vim.loop

local M = {}

-- LazyVim compatibility - provide a default config function
function M.config()
  -- Auto-load essential IDE configuration
  require("ide.config.core.options").setup()
  require("ide.config.bindings.keymaps").setup()
end

return M
