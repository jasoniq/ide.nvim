return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local config = require("ide.config")
		local user_config = config.plugins.lualine or {}

		local default_config = {
			options = {
				theme = "auto", -- Will auto-detect catppuccin
				globalstatus = true, -- Use global statusline
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter" },
				},
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { 
					{
						"filename",
						path = 1, -- Show relative path
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "lazy", "mason", "trouble" },
		}

		local final_config = vim.tbl_deep_extend("force", default_config, user_config)
		require("lualine").setup(final_config)
	end,
}