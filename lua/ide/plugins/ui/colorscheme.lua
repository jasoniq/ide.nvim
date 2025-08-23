return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local config = require("ide.config")
		local user_config = config.plugins.catppuccin or {}

		local default_config = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			integrations = {
				snacks = true,
				which_key = true,
				telescope = {
					enabled = true,
				},
				treesitter = true,
			},
		}

		local final_config = vim.tbl_deep_extend("force", default_config, user_config)
		require("catppuccin").setup(final_config)
	end,
}
