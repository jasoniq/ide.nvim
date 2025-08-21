# ide.nvim

A collection of neovim plugins which provide IDE functionality based on my personal preferences

## Installation

This plugin is built to be loaded by LazyVim but should work in other plugin managers.

 1. Set your prefered `<leader>` prefix
 2. Add `lazy.nvim` package manager
 3. Create plugin file: `lua/plugins/ide.lua`

## [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "jasoniq/ide.nvim",
    import = "ide.plugins",
    config = function()
        require("ide.config").setup({
            -- Optional: Customize which features to enable/disable
            features = {
                nvim_tree = true,     -- File explorer
                telescope = true,     -- Fuzzy finder
                which_key = true,     -- Key binding helper
                treesitter = true,    -- Syntax highlighting
            },
            -- Optional: Change colorscheme (default: "catppuccin")
            colorscheme = "catppuccin",
            -- Optional: Plugin-specific configurations
            plugins = {
                catppuccin = { flavour = "mocha" },
                nvim_tree = { view = { width = 30 } },
                telescope = { 
                    defaults = { 
                        layout_strategy = "horizontal" 
                    }
                },
                treesitter = {
                    ensure_installed = { "lua", "python", "javascript" }
                }
            },
            -- Optional: Custom keymaps
            keymaps = {
                n = {
                    ["<leader>gg"] = { "<cmd>LazyGit<CR>", { desc = "Open LazyGit" } }
                }
            }
        })
    end
}
```

 4. (Optional) For a minimal setup, you can use ide.nvim with default settings:

```lua
{
    "jasoniq/ide.nvim",
    import = "ide.plugins",
    config = function()
        require("ide.config").setup()  -- Uses all defaults
    end
}
```

## Configuration Options

### Features
Control which plugins are loaded:
- `nvim_tree`: File explorer (default: true)
- `telescope`: Fuzzy finder (default: true) 
- `which_key`: Key binding helper (default: true)
- `treesitter`: Syntax highlighting (default: true)

### Plugin Configuration
Each plugin can be customized via the `plugins` table. See individual plugin documentation for available options.

### Treesitter Language Parsers
By default, this plugin does NOT install any Treesitter language parsers to keep your setup minimal and fast. Add support for your preferred languages via the config:

```lua
plugins = {
    treesitter = {
        ensure_installed = { "lua", "python", "javascript" }
    }
}
```

After updating your config, run `:TSUpdate` in Neovim to install the parsers.

**Tip:** Only add languages you actually use to keep your setup lean!

### Custom Keymaps
Add your own keymaps in the format:
```lua
keymaps = {
    [mode] = {
        ["<key>"] = { "<command>", { desc = "description" } }
    }
}
```

## What makes a good IDE

**WARNING: Subjective opinion**

Neovim is primarily a text editor, but an IDE is much more than just an editor.

A good developer experience should be centered around the editor window, with a little as possible clutter surrounding it.
Modern IDE's tend to have many panels surrounding the editor window providing various bits of information and access to
various features. While useful, much of it is not important to see at all times, and tends to clutter the space at the
cost of reducing the size of the editor window, which should be the primary focus when coding.

With this in mind, this project aims to provide as much useful information around the editor and within the editor, while
minimizing clutter and proactively removing or closing various panes to optimize the coding editor experience.

### Core

 - Lua support functions
    - [Plenary](https://github.com/nvim-lua/plenary.nvim)
 - Easy TMUX navigation
    - [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
 - Folke Snacks
    - [folke/snacks.nvim](https://github.com/folke/snacks.nvim)

### Theme

 - Colorscheme
    - [Catppuccin](https://github.com/catppuccin/nvim)

### UI & Theme

 - UI - Dashboard, popups, animations, etc...
    - [Folke Snacks](https://github.com/folke/snacks.nvim)

### Editor plugins

 - Syntax highliting
    - [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 - Minimap & Scrolling
    - [Minimap.vim](https://github.com/wfxr/minimap.vim)
    - [neominimap.nvim](https://github.com/Isrothy/neominimap.nvim)
    - [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
 - Intellisense
    - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    - [mason](https://github.com/mason-org/mason.nvim)

### Supporting add-ons

 - File navigation
    - [telescope](https://github.com/nvim-telescope/telescope.nvim)
 
 - linting (nvm-lint)
 - Refactoring (refactoring.nvim)
 - Debugging (dap)
 - Session management (auto-session)

## Nice to haves

 - Visual file tree (nvim-tree)
 - Buffer & status enchancements (Bufferline & lualine)

