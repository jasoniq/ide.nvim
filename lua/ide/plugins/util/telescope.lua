local config = require("ide.config")

-- Only return the plugin if telescope feature is enabled
if not config.features.telescope then
  return {}
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Get user configuration for telescope
    local user_config = config.plugins.telescope or {}
    
    local default_config = {
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    }

    local final_config = vim.tbl_deep_extend("force", default_config, user_config)
    telescope.setup(final_config)

    telescope.load_extension("fzf")
  end,
}