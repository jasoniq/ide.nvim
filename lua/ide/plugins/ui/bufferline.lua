return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		local config = require("ide.config")
		local user_config = config.plugins.bufferline or {}

		local default_config = {
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				style_preset = require("bufferline").style_preset.default,
				themable = true, -- allows highlight groups to be overridden
				numbers = "none",
				close_command = function(bufnum)
					-- Use snacks bufdelete for smart buffer closing
					require("snacks").bufdelete(bufnum)
				end,
				right_mouse_command = function(bufnum)
					require("snacks").bufdelete(bufnum)
				end,
				left_mouse_command = "buffer %d", -- can be a string | function
				middle_mouse_command = function(bufnum)
					require("snacks").bufdelete(bufnum)
				end,
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 21,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				-- The diagnostics indicator can be set to nil to keep the buffer name highlight
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				duplicates_across_groups = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
				separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_after_current",
			},
		}

		local final_config = vim.tbl_deep_extend("force", default_config, user_config)
		require("bufferline").setup(final_config)
	end,
}