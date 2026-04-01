vim.uv = vim.uv or vim.loop

local M = {}

-- Setup is handled automatically via plugins/init.lua (ide-core spec).
-- This function is available for manual use outside of LazyVim.
function M.config()
  require("ide.config.core.options").setup()
  require("ide.config.bindings.keymaps").setup()
end

return M
