local config = require("ide.config")

-- Only return the plugin if nvim_tree feature is enabled
if not config.features.nvim_tree then
  return {}
end

return {
  -- and a directory file explorer that is easy to use
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    -- update the file explorer with nice icons
    -- https://github.com/nvim-tree/nvim-web-devicons
     "nvim-tree/nvim-web-devicons",
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Get user configuration for nvim-tree
    local user_config = config.plugins.nvim_tree or {}
    
    local default_config = {
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        ignore = false,
      },
    }

    local final_config = vim.tbl_deep_extend("force", default_config, user_config)
    nvimtree.setup(final_config)
  end
}