local M = {}

---@param user_keymaps? table
function M.setup(user_keymaps)
	local config = require("ide.config")
	local map = vim.keymap.set

	-- General keymaps (always enabled)
	map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
	map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
	map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
	map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "Toggle Relative Numbers" })

	-- Comment (always enabled)
	map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
	map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

	-- Snacks - UI & Project Management (always available)
	map("n", "<leader>e", function()
		Snacks.explorer()
	end, { desc = "File Explorer" })
	map("n", "<leader>d", function()
		Snacks.dashboard()
	end, { desc = "Dashboard" })

	-- Snacks Picker - UI-focused operations
	map("n", "<leader>sr", function()
		Snacks.picker.recent()
	end, { desc = "Recent Files (Snacks)" })
	map("n", "<leader>sp", function()
		Snacks.picker.projects()
	end, { desc = "Projects" })
	map("n", "<leader>sc", function()
		Snacks.picker.colorschemes()
	end, { desc = "Colorschemes" })
	map("n", "<leader>sn", function()
		Snacks.picker.notifications()
	end, { desc = "Notifications" })
	map("n", "<leader>si", function()
		Snacks.picker.icons()
	end, { desc = "Icons" })
	map("n", "<leader>sa", function()
		Snacks.picker.autocmds()
	end, { desc = "Autocmds" })

	-- Tier 1 Snacks Features
	map("n", "<leader>gg", function()
		Snacks.lazygit()
	end, { desc = "LazyGit" })
	map("n", "<leader>gf", function()
		Snacks.lazygit.log_file()
	end, { desc = "LazyGit File History" })
	map("n", "<leader>gl", function()
		Snacks.lazygit.log()
	end, { desc = "LazyGit Log" })
	map("n", "<leader>bd", function()
		Snacks.bufdelete()
	end, { desc = "Delete Buffer (Smart)" })

	-- Telescope - Find & Search
	if config.features.telescope then
		-- Files
		map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
		map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
		map("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git Files" })

		-- Search
		map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find Word" })
		map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find Word under Cursor" })
		map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
		map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find Keymaps" })
		map("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Find Marks" })

		-- Buffers & Tabs
		map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
		map("n", "<leader>ft", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find Text in Buffer" })

		-- Git integration
		map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
		map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
		map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
	end

	-- Treesitter - Code Navigation & Selection
	if config.features.treesitter then
		map("n", "<leader>ts", "<cmd>TSToggle highlight<cr>", { desc = "Toggle Syntax Highlighting" })
		map("n", "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", { desc = "Treesitter Playground" })
	end

	-- Buffer Management (note: <leader>bd is handled by Snacks above)
	map("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
	map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
	map("n", "<leader>ba", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other Buffers" })
	map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close Buffers to Left" })
	map("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close Buffers to Right" })
	
	-- Buffer picking and navigation
	map("n", "<leader>bo", "<cmd>BufferLinePick<cr>", { desc = "Pick Buffer" })
	map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
	map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

	-- Window Management
	map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
	map("n", "<leader>wh", "<cmd>split<cr>", { desc = "Horizontal Split" })
	map("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close Window" })
	map("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only Window" })
	map("n", "<leader>w=", "<C-w>=", { desc = "Equalize Windows" })

	-- Quick Actions
	map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
	map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit All" })
	map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
	map("n", "<leader>W", "<cmd>wa<cr>", { desc = "Save All" })

	-- LSP - Language Server Protocol
	if config.features.lsp then
		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
		map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
		map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
		map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
		map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })

		-- Documentation
		map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

		-- Code Actions
		map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
		map("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
		map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
		map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Document" })
		map("v", "<leader>cf", vim.lsp.buf.format, { desc = "Format Selection" })

		-- Diagnostics
		map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
		map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
		map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
		map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Diagnostics to Location List" })

		-- Workspace
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder" })
		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { desc = "List Workspace Folders" })

		-- Mason LSP Management
		map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason LSP Manager" })
		map("n", "<leader>cR", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
	end

	-- Which-key helper
	if config.features.which_key then
		map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Show All Keymaps" })
	end

	-- Apply user-defined keymaps
	if user_keymaps then
		for mode, mappings in pairs(user_keymaps) do
			for key, mapping in pairs(mappings) do
				if type(mapping) == "table" then
					map(mode, key, mapping[1], mapping[2] or {})
				else
					map(mode, key, mapping)
				end
			end
		end
	end
end

return M
