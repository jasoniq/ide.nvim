return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto", -- Will auto-detect catppuccin
      globalstatus = true, -- Use global statusline
      disabled_filetypes = {
        statusline = { "dashboard", "alpha", "starter" },
      },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          "filename",
          path = 1, -- Show relative path
          symbols = {
            modified = " ●",
            readonly = " ",
            unnamed = "[No Name]",
          },
        },
      },
      lualine_x = { 
        {
          -- LSP server status
          function()
            local clients = vim.lsp.get_active_clients({ bufnr = 0 })
            if #clients == 0 then
              return ""
            end
            
            local names = {}
            for _, client in ipairs(clients) do
              table.insert(names, client.name)
            end
            
            return " " .. table.concat(names, ", ")
          end,
          color = { fg = "#98be65" }, -- Green color for active LSP
        },
        "encoding", 
        "fileformat", 
        "filetype" 
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "lazy", "mason", "trouble" },
  },
}
