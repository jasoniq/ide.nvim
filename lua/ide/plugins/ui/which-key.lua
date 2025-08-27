-- Only return the plugin if keybind_help feature is enabled (default to true if config not available yet)
local config = require("ide.config")
local features = config.features or {}
if features.keybind_help == false then
  return {}
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    preset = "modern",
    delay = 300,
  },
  config = function(_, opts)
    local which_key = require("which-key")
    which_key.setup(opts)

    -- Register group names for organized display
    which_key.add({
      { "<leader>f", group = "Find (Telescope)", icon = "🔍" },
      { "<leader>g", group = "Git", icon = "🌿" },
      { "<leader>s", group = "Snacks", icon = "🍿" },
      { "<leader>b", group = "Buffer", icon = "📄" },
      { "<leader>w", group = "Window", icon = "🪟" },
      { "<leader>t", group = "Treesitter", icon = "🌳" },
      { "<leader>c", group = "Code", icon = "💻" },
      { "<leader>d", group = "Debug", icon = "🐛" },
    })

    -- Additional registration for LSP mappings if LSP is enabled
    local features = config.features or {}
    if features.lsp ~= false then
      which_key.add({
        -- Code group (<leader>c) - LSP actions
        { "<leader>ca", desc = "Code Actions", mode = { "n", "v" } },
        { "<leader>cr", desc = "Rename Symbol" },
        { "<leader>cf", desc = "Format Document", mode = { "n", "v" } },
        { "<leader>cd", desc = "Show Line Diagnostics" },
        { "<leader>cq", desc = "Diagnostics to Location List" },
        { "<leader>cm", desc = "Mason LSP Manager" },
        { "<leader>cR", desc = "Restart LSP" },

        -- Refactoring group (<leader>r)
        { "<leader>r", group = "Refactor", icon = "🔧" },
        { "<leader>re", desc = "Extract Function", mode = { "n", "x" } },
        { "<leader>rf", desc = "Extract Function To File", mode = { "n", "x" } },
        { "<leader>rv", desc = "Extract Variable", mode = { "n", "x" } },
        { "<leader>ri", desc = "Inline Variable", mode = { "n", "x" } },
        { "<leader>rI", desc = "Inline Function", mode = { "n", "x" } },
        { "<leader>rb", desc = "Extract Block", mode = { "n", "x" } },
        { "<leader>rbf", desc = "Extract Block To File", mode = { "n", "x" } },
        { "<leader>rp", desc = "Debug Print", mode = { "n", "x" } },
        { "<leader>rP", desc = "Print Variable", mode = { "n", "x" } },
        { "<leader>rc", desc = "Cleanup Debug Prints", mode = "n" },
        { "<leader>rr", desc = "Refactor Menu", mode = { "n", "x" } },

        -- LSP Navigation (separate from leader groups)
        { "g", group = "Go to (LSP)" },
        { "gd", desc = "Go to Definition" },
        { "gD", desc = "Go to Declaration" },
        { "gi", desc = "Go to Implementation" },
        { "gt", desc = "Go to Type Definition" },
        { "gr", desc = "Go to References" },

        -- Documentation & Diagnostics
        { "K", desc = "Hover Documentation" },
        { "[d", desc = "Previous Diagnostic" },
        { "]d", desc = "Next Diagnostic" },
      })
    end

    -- Register Tier 1 Snacks features
    which_key.add({
      -- Git group enhancements
      { "<leader>gg", desc = "LazyGit" },
      { "<leader>gf", desc = "LazyGit File History" },
      { "<leader>gl", desc = "LazyGit Log" },

      -- Buffer management enhancements
      { "<leader>bd", desc = "Delete Buffer (Smart)" },

      -- UI Focus Features
      { "<leader>z", desc = "Toggle Zen Mode" },
      { "<leader>Z", desc = "Toggle Zoom" },

      -- Development Tools
      { "<leader>cR", desc = "Rename File (Smart)" },
      { "<leader>.", desc = "Toggle Scratch Buffer" },
      { "<leader>S", desc = "Select Scratch Buffer" },

      -- Debug (DAP) group
      { "<leader>db", desc = "Toggle Breakpoint" },
      { "<leader>dB", desc = "Conditional Breakpoint" },
      { "<leader>dl", desc = "Log Point" },
      { "<leader>dc", desc = "Continue" },
      { "<leader>ds", desc = "Step Over" },
      { "<leader>di", desc = "Step Into" },
      { "<leader>do", desc = "Step Out" },
      { "<leader>dt", desc = "Terminate Debug" },
      { "<leader>du", desc = "Toggle Debug UI" },
      { "<leader>de", desc = "Evaluate Expression", mode = { "n", "v" } },
      { "<leader>dr", desc = "Open REPL" },
      { "<leader>dR", desc = "Run Last Debug" },
      { "<leader>dC", desc = "DAP Commands" },
      { "<leader>dv", desc = "DAP Variables" },
      { "<leader>df", desc = "DAP Frames" },
      { "<leader>dL", desc = "List Breakpoints" },
    })
  end,
}
