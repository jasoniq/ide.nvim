---@class IDEFeatures
---@field telescope? boolean
---@field which_key? boolean
---@field treesitter? boolean

---@class IDEVimOptions
---@field expandtab? boolean
---@field shiftwidth? number
---@field tabstop? number
---@field softtabstop? number
---@field smartindent? boolean
---@field ignorecase? boolean
---@field smartcase? boolean
---@field cursorline? boolean
---@field cursorlineopt? string
---@field number? boolean
---@field numberwidth? number
---@field clipboard? string
---@field mouse? string
---@field timeoutlen? number
---@field fillchars? table
---@field whichwrap? string

---@class IDEConfig
---@field colorscheme? string|fun()
---@field options? IDEVimOptions
---@field keymaps? table
---@field plugins? table<string, table>
---@field features? IDEFeatures

local M = {}

---@type IDEConfig
local defaults = {
  ---@type string|fun()
  colorscheme = "catppuccin",
  options = {},
  keymaps = {},
  plugins = {},
  features = {
    telescope = true,
    which_key = true,
    treesitter = true,
  },
}

---@type IDEConfig
local options

---@param opts? IDEConfig
function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  -- Colorscheme loading is handled by individual plugin files
  -- Function-based colorschemes are called directly here
  if type(options.colorscheme) == "function" then
    options.colorscheme()
  end

  require("ide.config.options").setup(options.options or {})
  require("ide.config.keymaps").setup(options.keymaps or {})
end

setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end
    ---@cast options[key]
    return options[key]
  end,
})

return M
