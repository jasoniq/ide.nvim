---@type IDEConfig
local defaults = {
  ---@type string|fun()
  colorscheme = "catppuccin",
  options = {},
  keymaps = {},
  features = {
    telescope = true,
    which_key = true,
    treesitter = true,
    lsp = true,
    lualine = true,
    refactoring = true,
    dap = true,
  },
}

return defaults
