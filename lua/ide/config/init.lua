---@class IDEConfig
local M = {}

---@class IDEOptions
local defaults = {
  ---@type string|fun()
  colorscheme = function()
    require("catppuccin").setup()

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
  end
}

---@type IDEOptions
local options

---@param opts? IDEOptions
function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  -- Load colorscheme
  if type(options.colorscheme) == "function" then
    options.colorscheme()
  elseif type(options.colorscheme) == "string" then
    vim.cmd.colorscheme(options.colorscheme)
  end

  require("ide.config.options").setup()
  require("ide.config.keymaps").setup()
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
