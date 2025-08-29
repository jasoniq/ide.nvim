-- Import type definitions
require("ide.config.core.types")

local M = {}
local defaults = require("ide.config.core.defaults")

-- Initialize with defaults immediately so plugins can access config
local options = vim.deepcopy(defaults)

-- Config is mainly used by plugins to check feature flags
-- All setup is handled automatically via plugins/init.lua

-- Direct access to config properties
setmetatable(M, {
  __index = function(_, key)
    return options[key]
  end,
})

return M
