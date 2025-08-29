local M = {}

function M.setup()
  local opt = vim.opt
  local o = vim.o
  local g = vim.g

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

  -- Sensible defaults
  o.expandtab = true
  o.shiftwidth = 2
  o.tabstop = 2
  o.softtabstop = 2
  o.smartindent = true
  o.ignorecase = true
  o.smartcase = true
  o.cursorline = true
  o.cursorlineopt = "number"
  o.number = true
  o.numberwidth = 2
  o.clipboard = "unnamedplus"
  o.mouse = "a"
  o.timeoutlen = 400
  o.ruler = false

  opt.fillchars = { eob = " " }
  opt.whichwrap = "<>[]hl"
end

return M
