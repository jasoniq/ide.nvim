return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local config = require("ide.config")
		local user_config = config.plugins.refactoring or {}

		local default_config = {
			prompt_func_return_type = {
				go = false,
				java = false,
				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			prompt_func_param_type = {
				go = false,
				java = false,
				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			printf_statements = {},
			print_var_statements = {},
			show_success_message = false,
		}

		local final_config = vim.tbl_deep_extend("force", default_config, user_config)
		require("refactoring").setup(final_config)

		-- Telescope integration if telescope is enabled
		if config.features.telescope then
			require("telescope").load_extension("refactoring")
		end
	end,
}