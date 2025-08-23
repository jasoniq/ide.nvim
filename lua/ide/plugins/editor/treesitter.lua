local config = require("ide.config")

-- Only return the plugin if treesitter feature is enabled
if not config.features.treesitter then
	return {}
end

-- NOTE:
-- No Treesitter language parsers are installed by default.
-- This keeps your Neovim setup minimal and fast.
-- To add support for specific languages, update the `ensure_installed` list below
-- or follow the instructions in the README.

return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- Get user configuration for treesitter
		local user_config = config.plugins.treesitter or {}

		local default_config = {
			-- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				-- Add language parsers here, e.g. "lua", "python"
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		}

		local final_config = vim.tbl_deep_extend("force", default_config, user_config)
		treesitter.setup(final_config)
	end,
}
