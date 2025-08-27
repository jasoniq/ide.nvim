return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
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
	},
}
