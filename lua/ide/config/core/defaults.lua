---@type IDEConfig
local defaults = {
  ---@type string|fun()
  colorscheme = "catppuccin",
  features = {
    finder = true,
    keybind_help = true,
    syntax_highlighting = true,
    lsp = true,
    statusline = true,
    refactoring = true,
    debugging = true,
  },
}

return defaults
