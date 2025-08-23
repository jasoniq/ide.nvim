vim.uv = vim.uv or vim.loop

local M = {}

---@param opts? IDEConfig
function M.setup(opts)
	require("ide.config").setup(opts)
end

return M
