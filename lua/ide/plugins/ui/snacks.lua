return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Essential features (always enabled)
    bigfile = { enabled = true },
    dashboard = { enabled = true, example = "advanced" },
    explorer = { enabled = true },
    picker = { 
      enabled = true,
      hidden = true, -- Show hidden files by default
    },

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
