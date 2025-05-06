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

    nvimtree.setup({
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
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
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
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
    keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
  end
}
