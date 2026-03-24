return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Essential features (always enabled)
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      example = "advanced",
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "fortune -s",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    explorer = { enabled = false },
    picker = { enabled = false },

    -- Tier 1 - Essential IDE Features
    notifier = { enabled = true }, -- Better vim.notify with modern UI
    bufdelete = { enabled = true }, -- Delete buffers without disrupting layout
    words = { enabled = true }, -- Auto-highlight LSP references (like VS Code)
    lazygit = {
      enabled = true,
      configure = true, -- Auto-configure colorscheme integration
    },
    animate = { enabled = true }, -- Smooth animations with 45+ easing functions

    -- UI Focus Features
    dim = { enabled = true }, -- Focus on active scope by dimming the rest
    indent = { enabled = true }, -- Indent guides and scope visualization
    zen = { enabled = true }, -- Distraction-free coding mode
    toggle = { enabled = true }, -- Toggle functionality for UI features

    -- Simple Enhancements
    input = { enabled = true }, -- Better vim.ui.input prompts
    statuscolumn = { enabled = true }, -- Enhanced line numbers and gutter

    -- Development Tools
    scope = { enabled = true }, -- Smart scope detection and text object jumping
    rename = { enabled = true }, -- LSP-integrated file renaming
    scratch = { enabled = true }, -- Temporary/persistent scratch buffers for quick notes
    debug = { enabled = true }, -- Pretty debugging tools and data inspection
  },
}
