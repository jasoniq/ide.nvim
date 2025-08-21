local M = {}

---@param user_keymaps? table
function M.setup(user_keymaps)
  local config = require("ide.config")
  local map = vim.keymap.set

  -- General keymaps (always enabled)
  map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
  map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
  map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
  map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

  -- Comment (always enabled)
  map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
  map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

  -- Feature-specific keymaps
  -- File explorer (snacks) - always available since it's in core
  map("n", "<leader>e", function() Snacks.explorer() end, { desc = "Explorer" })

  if config.features.telescope then
    map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end

  if config.features.which_key then
    map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
  end

  -- Apply user-defined keymaps
  if user_keymaps then
    for mode, mappings in pairs(user_keymaps) do
      for key, mapping in pairs(mappings) do
        if type(mapping) == "table" then
          map(mode, key, mapping[1], mapping[2] or {})
        else
          map(mode, key, mapping)
        end
      end
    end
  end
end

return M