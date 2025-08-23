-- Import type definitions
require("ide.config.core.types")

local M = {}
local defaults = require("ide.config.core.defaults")

---@type IDEConfig
local options

---@param opts? IDEConfig
function M.setup(opts)
	options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

	-- Colorscheme loading
	if type(options.colorscheme) == "function" then
		-- Custom colorscheme functions
		options.colorscheme()
	elseif type(options.colorscheme) == "string" then
		-- Set default colorscheme - users can switch via snacks picker (<leader>sc)
		vim.cmd.colorscheme(options.colorscheme)
	end

	require("ide.config.core.options").setup(options.options or {})
	require("ide.config.bindings.keymaps").setup(options.keymaps or {})
end

setmetatable(M, {
	__index = function(_, key)
		if options == nil then
			return vim.deepcopy(defaults)[key]
		end
		---@cast options[key]
		return options[key]
	end,
})

return M
