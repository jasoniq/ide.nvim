# ide.nvim

A modern, minimal IDE configuration for Neovim with carefully curated plugins and sensible defaults.

## Installation

### Requirements
- Neovim 0.9+
- [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager
- LazyVim (recommended) or compatible configuration

### Setup
1. Set your preferred `<leader>` prefix
2. Add to your LazyVim plugins directory: `lua/plugins/ide.lua`

### Full Configuration Example

```lua
{
    "jasoniq/ide.nvim",
    import = "ide.plugins",
    config = function()
        require("ide.config").setup({
            -- Optional: Customize which features to enable/disable
            features = {
                telescope = true,     -- Fuzzy finder
                which_key = true,     -- Key binding helper
                treesitter = true,    -- Syntax highlighting
            },
            -- Optional: Change colorscheme (default: "catppuccin")
            colorscheme = "catppuccin",
            -- Optional: Plugin-specific configurations
            plugins = {
                catppuccin = { flavour = "mocha" },
                snacks = { 
                    explorer = { enabled = true },
                    dashboard = { enabled = true, example = "advanced" }
                },
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

### Minimal Setup

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
Control which optional plugins are loaded:
- `telescope`: Fuzzy finder (default: true) 
- `which_key`: Key binding helper (default: true)
- `treesitter`: Syntax highlighting (default: true)

**Core components** (always included):
- File explorer via snacks (`<leader>e`)
- Dashboard with project shortcuts (`<leader>d`)
- Catppuccin colorscheme + live theme picker (`<leader>sc`)

### Plugin Configuration
Each plugin can be customized via the `plugins` table:

```lua
plugins = {
    -- Colorscheme options
    catppuccin = { flavour = "mocha" },
    
    -- Snacks UI components
    snacks = { 
        dashboard = { enabled = true, example = "advanced" },
        explorer = { enabled = true }
    },
    
    -- Language support (only installs what you specify)
    treesitter = {
        ensure_installed = { "lua", "python", "javascript" }
    },
    
    -- Fuzzy finder customization
    telescope = { 
        defaults = { layout_strategy = "horizontal" }
    }
}
```

### Vim Options
Customize editor behavior while preserving IDE essentials:

```lua
options = {
    -- Indentation (default: 2 spaces)
    shiftwidth = 4,
    tabstop = 4,
    
    -- Interface preferences
    number = true,
    cursorline = true,
    clipboard = "unnamedplus"
}
```

### Default Keymaps

The IDE uses a **hybrid approach** combining the best of both worlds:

#### Core Navigation
- `<leader>e` - File Explorer (snacks)
- `<leader>d` - Dashboard (snacks)
- `<Esc>` - Clear search highlights
- `<C-s>` - Save file

#### 🍿 Snacks - UI & Project Management (`<leader>s`)
- `<leader>sr` - Recent Files
- `<leader>sp` - Projects  
- `<leader>sc` - Colorscheme Picker (switch themes live)
- `<leader>sn` - Notifications
- `<leader>si` - Icons
- `<leader>sa` - Autocmds

#### 🔍 Telescope - Find & Search (`<leader>f`)
- `<leader>ff` - Find Files
- `<leader>fr` - Recent Files
- `<leader>fg` - Git Files
- `<leader>fw` - Find Word (live grep)
- `<leader>fc` - Find Word under Cursor
- `<leader>fb` - Find Buffers
- `<leader>fh` - Find Help
- `<leader>fk` - Find Keymaps

#### 🌿 Git via Telescope (`<leader>g`)
- `<leader>gc` - Git Commits
- `<leader>gs` - Git Status
- `<leader>gb` - Git Branches

#### Buffer Management (`<leader>b`)
- `<leader>bd` - Delete Buffer
- `<leader>bn` - Next Buffer
- `<leader>bp` - Previous Buffer
- `<leader>ba` - Delete All Buffers

#### Window Management (`<leader>w`)
- `<leader>wv` - Vertical Split
- `<leader>wh` - Horizontal Split
- `<leader>wc` - Close Window
- `<leader>wo` - Only Window
- `<leader>w=` - Equalize Windows

#### Code Actions
- `gd` - Go to Definition (LSP)
- `gr` - Go to References (LSP) 
- `K` - Hover Documentation (LSP)
- `<leader>ca` - Code Actions (LSP)
- `<leader>rn` - Rename Symbol (LSP)

#### Quick Actions
- `<leader>q` - Quit
- `<leader>w` - Save
- `<leader>/` - Toggle Comment

### Custom Keymaps
Add your own keymaps via configuration:
```lua
keymaps = {
    n = {
        ["<leader>gg"] = { "<cmd>LazyGit<CR>", { desc = "Open LazyGit" } }
    }
}
```

## IDE Philosophy

**Editor-Centric Development Experience**

A truly productive IDE should maximize coding focus while minimizing visual noise. The editor window is your primary workspace—everything else should enhance this experience without competing for attention.

This project delivers essential IDE functionality through carefully curated, optional plugins that integrate seamlessly. Rather than overwhelming you with panels and widgets, it provides powerful tools that stay out of your way until needed.

**Key Principles:**
- **Minimal by default**: Only load what you actually use
- **Configurable without complexity**: Sensible defaults, easy customization
- **Integrated experience**: Cohesive tools that work together naturally
- **Performance focused**: Fast startup, responsive editing

## What's Included

### Core Foundation
Essential utilities that form the IDE backbone:
- **[Plenary](https://github.com/nvim-lua/plenary.nvim)** - Lua utility functions for plugin ecosystem
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless navigation between vim splits and tmux panes

### Integrated UI System
**[Snacks.nvim](https://github.com/folke/snacks.nvim)** provides UI and project management:
- **Dashboard** - Clean startup screen with project shortcuts (`<leader>d`)
- **File Explorer** - Modern picker-style file browsing (`<leader>e`)
- **Project Picker** - Quick project switching (`<leader>sp`)
- **Utilities** - Notifications, colorschemes, icons (`<leader>s*`)

### Smart Code Features
**[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** (optional)
- Advanced syntax highlighting and code understanding
- Language parsers installed on-demand to keep setup lean

**[Telescope](https://github.com/nvim-telescope/telescope.nvim)** (optional)
- Battle-tested search and navigation (`<leader>f*`)
- LSP integration, git operations, buffer management
- Mature ecosystem with extensive customization options

**[Which-Key](https://github.com/folke/which-key.nvim)** (optional)
- Interactive keymap help for discovering shortcuts
- Self-documenting workflow

### Visual Experience
**Integrated Colorscheme Management**:
- **Catppuccin** set as default theme (provided by snacks plugin)
- **Live theme switching** via snacks picker (`<leader>sc`)
- **Runtime discovery** - try different colorschemes without restart
- **Consistent theming** across the entire plugin ecosystem

