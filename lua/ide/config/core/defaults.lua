---@type IDEConfig
local defaults = {
	---@type string|fun()
	colorscheme = "catppuccin",
	options = {},
	keymaps = {},
	plugins = {},
	features = {
		telescope = true,
		which_key = true,
		treesitter = true,
		lsp = true,
	},
}

return defaults
