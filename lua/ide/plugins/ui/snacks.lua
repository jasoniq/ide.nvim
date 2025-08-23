local config = require("ide.config")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		-- Get user configuration for snacks
		local user_config = config.plugins.snacks or {}

		local default_config = {
			-- Essential features (always enabled)
			bigfile = { enabled = true },
			dashboard = { enabled = true, example = "advanced" },
			explorer = { enabled = true },
			picker = { enabled = true },

			-- Tier 1 - Essential IDE Features
			notifier = { enabled = true }, -- Better vim.notify with modern UI
			bufdelete = { enabled = true }, -- Delete buffers without disrupting layout
			words = { enabled = true }, -- Auto-highlight LSP references (like VS Code)
			lazygit = {
				enabled = true,
				configure = true, -- Auto-configure colorscheme integration
			},
		}

		local final_config = vim.tbl_deep_extend("force", default_config, user_config)
		require("snacks").setup(final_config)
	end,
}
