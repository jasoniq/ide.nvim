-- open nvim-tree on VimEnter
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local function open_nvim_tree()

  -- open nvim-tree
  require("nvim-tree.api").tree.open()
end
