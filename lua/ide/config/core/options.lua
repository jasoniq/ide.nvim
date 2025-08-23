local M = {}

---@param user_options? table<string, any>
function M.setup(user_options)
	local opt = vim.opt
	local o = vim.o
	local g = vim.g

	-------------------------------------- Fixed IDE Options ------------------------------------------
	-- These options are essential for IDE functionality and cannot be changed

	-- IDE Performance & Integration
	o.laststatus = 3 -- Global statusline for modern IDE experience
	o.signcolumn = "yes" -- Always show sign column for LSP/git indicators
	o.updatetime = 250 -- Fast updates for gitsigns/LSP responsiveness
	o.undofile = true -- Persistent undo for professional workflow

	-- IDE Layout & Behavior
	o.splitbelow = true -- Consistent split directions
	o.splitright = true
	o.showmode = false -- Modern statuslines handle mode display
	opt.shortmess:append("sI") -- Clean startup without intro

	-- Performance: Disable unused providers
	g.loaded_node_provider = 0
	g.loaded_python3_provider = 0
	g.loaded_perl_provider = 0
	g.loaded_ruby_provider = 0

	-- Tool Integration: Add mason binaries to PATH
	local is_windows = vim.fn.has("win32") ~= 0
	local sep = is_windows and "\\" or "/"
	local delim = is_windows and ";" or ":"
	vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

	-------------------------------------- Configurable Options ------------------------------------------
	-- User preferences that can be customized via config

	-- Default user-configurable options
	local configurable_defaults = {
		-- Indentation preferences
		expandtab = true,
		shiftwidth = 2,
		tabstop = 2,
		softtabstop = 2,
		smartindent = true,

		-- Search behavior
		ignorecase = true,
		smartcase = true,

		-- Display preferences
		cursorline = true,
		cursorlineopt = "number",
		number = true,
		numberwidth = 2,

		-- System integration
		clipboard = "unnamedplus",
		mouse = "a",

		-- Timing
		timeoutlen = 400,

		-- Visual tweaks
		fillchars = { eob = " " },
		whichwrap = "<>[]hl",
	}

	-- Merge user options with defaults
	local final_options = vim.tbl_deep_extend("force", configurable_defaults, user_options or {})

	-- Apply configurable options
	for option, value in pairs(final_options) do
		if option == "fillchars" or option == "whichwrap" then
			-- Special handling for opt-style options
			if option == "fillchars" then
				opt.fillchars = value
			elseif option == "whichwrap" then
				opt.whichwrap = value
			end
		else
			-- Standard vim options
			o[option] = value
		end
	end

	-- Always set ruler to false (part of modern IDE experience)
	o.ruler = false
end

return M
