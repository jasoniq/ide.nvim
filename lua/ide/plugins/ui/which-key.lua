local config = require("ide.config")

-- Only return the plugin if which_key feature is enabled
if not config.features.which_key then
	return {}
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local which_key = require("which-key")

		-- Get user configuration for which-key
		local user_config = config.plugins.which_key or {}

		local default_config = {
			preset = "modern",
			delay = 300,
		}

		local final_config = vim.tbl_deep_extend("force", default_config, user_config)
		which_key.setup(final_config)

		-- Register group names for organized display
		which_key.add({
			{ "<leader>f", group = "Find (Telescope)", icon = "🔍" },
			{ "<leader>g", group = "Git", icon = "🌿" },
			{ "<leader>s", group = "Snacks", icon = "🍿" },
			{ "<leader>b", group = "Buffer", icon = "📄" },
			{ "<leader>w", group = "Window", icon = "🪟" },
			{ "<leader>t", group = "Treesitter", icon = "🌳" },
			{ "<leader>c", group = "Code", icon = "💻" },
		})

		-- Additional registration for LSP mappings if LSP is enabled
		local config = require("ide.config")
		if config.features.lsp then
			which_key.add({
				-- Code group (<leader>c) - LSP actions
				{ "<leader>ca", desc = "Code Actions", mode = { "n", "v" } },
				{ "<leader>cr", desc = "Rename Symbol" },
				{ "<leader>cf", desc = "Format Document", mode = { "n", "v" } },
				{ "<leader>cd", desc = "Show Line Diagnostics" },
				{ "<leader>cq", desc = "Diagnostics to Location List" },
				{ "<leader>cm", desc = "Mason LSP Manager" },
				{ "<leader>cR", desc = "Restart LSP" },

				-- LSP Navigation (separate from leader groups)
				{ "g", group = "Go to (LSP)" },
				{ "gd", desc = "Go to Definition" },
				{ "gD", desc = "Go to Declaration" },
				{ "gi", desc = "Go to Implementation" },
				{ "gt", desc = "Go to Type Definition" },
				{ "gr", desc = "Go to References" },

				-- Documentation & Diagnostics
				{ "K", desc = "Hover Documentation" },
				{ "[d", desc = "Previous Diagnostic" },
				{ "]d", desc = "Next Diagnostic" },
			})
		end

		-- Register Tier 1 Snacks features
		which_key.add({
			-- Git group enhancements
			{ "<leader>gg", desc = "LazyGit" },
			{ "<leader>gf", desc = "LazyGit File History" },
			{ "<leader>gl", desc = "LazyGit Log" },

			-- Buffer management enhancements
			{ "<leader>bd", desc = "Delete Buffer (Smart)" },
		})
	end,
}
