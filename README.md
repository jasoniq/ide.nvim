# ide.nvim

A modern, comprehensive IDE configuration for Neovim built on minimal philosophy with enterprise-grade capabilities.

## 🎯 Philosophy

**Zero-Configuration IDE Experience**

A truly productive IDE should work immediately without complex setup. This configuration delivers professional-grade development capabilities through carefully curated plugins that auto-configure themselves, staying out of your way while providing enterprise features.

**Key Principles:**
- **Zero setup required**: Everything works out of the box
- **Professional grade**: Enterprise debugging, refactoring, and language support
- **Finder-centric**: Use fuzzy finding over visual clutter
- **Auto-managed**: Mason handles tool installation automatically
- **Native customization**: Pure lazy.nvim patterns, no custom config system

## ⚡ Quick Start

### Requirements
- Neovim 0.10+
- [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager

### Installation

Add to your LazyVim plugins:

```lua
{
  "jasoniq/ide.nvim",
  import = "ide.plugins",
  -- That's it! Auto-loads vim options, keymaps, and colorscheme
}
```

## 🏗️ Complete Feature Set

### Core Foundation
- **Plugin Management**: LazyVim-style organization with lazy loading
- **Configuration**: Centralized config system with user customization
- **UI**: Catppuccin theme + Lualine statusline + smooth animations

### 🔍 Navigation & Search
- **Telescope**: Fuzzy finding for files, text, buffers, and more
- **Snacks Explorer**: Modern file browser with project navigation
- **Smart Scope**: Treesitter-based semantic code navigation
- **Which-Key**: Interactive keymap discovery

### 💻 Language Support
- **LSP**: Full Language Server Protocol with Mason management
- **Completion**: nvim-cmp with intelligent suggestions and snippets
- **Treesitter**: Advanced syntax highlighting and code understanding
- **Mason**: Automatic LSP server, formatter, and linter installation

### 🔧 Professional Refactoring
- **Extract Operations**: Functions, variables, blocks to files
- **Inline Operations**: Variables and functions
- **Debug Workflow**: Smart debug print insertion and cleanup
- **Telescope Integration**: Refactoring command discovery
- **Multi-Language**: JavaScript, Python, Go, TypeScript, and more

### 🐛 Enterprise Debugging
- **Visual Debugging**: Full DAP (Debug Adapter Protocol) with UI
- **Multi-Language**: Python, Node.js, Go debuggers via Mason
- **Professional Features**: Breakpoints, variable inspection, call stacks
- **Advanced Capabilities**: Conditional breakpoints, log points, REPL

### ⚡ Productivity & Focus
- **Focus Modes**: Zen mode and zoom for distraction-free coding
- **Scratch Buffers**: Quick notes and experimentation
- **Git Integration**: LazyGit with file history and status
- **Smart Buffers**: Intelligent buffer management preserving window layouts

## 📖 Complete Keymap Reference

### Core Navigation
- `<leader>e` - File Explorer
- `<leader>d` - Dashboard
- `<Esc>` - Clear search highlights  
- `<C-s>` - Save file

### 🔍 Telescope - Find & Search (`<leader>f`)
- `<leader>ff` - Find Files
- `<leader>fr` - Recent Files  
- `<leader>fg` - Git Files
- `<leader>fw` - Find Word (live grep)
- `<leader>fc` - Find Word under Cursor
- `<leader>fb` - Find Buffers
- `<leader>ft` - Find Text in Buffer
- `<leader>fh` - Find Help
- `<leader>fk` - Find Keymaps
- `<leader>fm` - Find Marks

### 🍿 Snacks - UI & Project (`<leader>s`)
- `<leader>sr` - Recent Files (Snacks)
- `<leader>sp` - Projects
- `<leader>sc` - Colorschemes (live switching)
- `<leader>sn` - Notifications
- `<leader>si` - Icons
- `<leader>sa` - Autocmds

### 🌿 Git Integration (`<leader>g`)
- `<leader>gg` - LazyGit
- `<leader>gf` - LazyGit File History
- `<leader>gl` - LazyGit Log
- `<leader>gc` - Git Commits (Telescope)
- `<leader>gs` - Git Status (Telescope)  
- `<leader>gb` - Git Branches (Telescope)

### 🔧 Refactoring (`<leader>r`)
**Code Structure:**
- `<leader>re` - Extract Function
- `<leader>rf` - Extract Function to File
- `<leader>rv` - Extract Variable
- `<leader>ri` - Inline Variable
- `<leader>rI` - Inline Function
- `<leader>rb` - Extract Block
- `<leader>rbf` - Extract Block to File
- `<leader>rr` - Refactoring Menu (Telescope)

**Debug Workflow:**
- `<leader>rp` - Debug Print
- `<leader>rP` - Print Variable
- `<leader>rc` - Cleanup Debug Prints

### 🐛 Debugging (`<leader>d`)
**Breakpoints:**
- `<leader>db` - Toggle Breakpoint
- `<leader>dB` - Conditional Breakpoint
- `<leader>dl` - Log Point
- `<leader>dL` - List Breakpoints (Telescope)

**Debug Control:**
- `<leader>dc` - Continue/Start Debug
- `<leader>ds` - Step Over
- `<leader>di` - Step Into
- `<leader>do` - Step Out  
- `<leader>dt` - Terminate Debug

**Debug UI & Analysis:**
- `<leader>du` - Toggle Debug UI
- `<leader>de` - Evaluate Expression
- `<leader>dr` - Open REPL
- `<leader>dR` - Run Last Debug
- `<leader>dC` - DAP Commands (Telescope)
- `<leader>dv` - DAP Variables (Telescope)
- `<leader>df` - DAP Frames (Telescope)

### 💻 Code & LSP (`<leader>c`)
**Navigation:**
- `gd` - Go to Definition
- `gD` - Go to Declaration
- `gi` - Go to Implementation
- `gt` - Go to Type Definition
- `gr` - Go to References

**Code Actions:**
- `<leader>ca` - Code Actions
- `<leader>cr` - Rename Symbol (LSP)
- `<leader>cf` - Format Document
- `<leader>cd` - Show Diagnostics
- `<leader>cq` - Diagnostics to Location List

**Management:**
- `<leader>cm` - Mason LSP Manager
- `<leader>cR` - Restart LSP (or Rename File - Smart)

### Buffer Management (`<leader>b`)
- `<leader>bd` - Delete Buffer (Smart)
- `<leader>bn` - Next Buffer
- `<leader>bp` - Previous Buffer
- `<S-h>` - Previous Buffer
- `<S-l>` - Next Buffer

### Window Management (`<leader>w`)
- `<leader>wv` - Vertical Split
- `<leader>wh` - Horizontal Split
- `<leader>wc` - Close Window
- `<leader>wo` - Only Window
- `<leader>w=` - Equalize Windows

### Focus & Productivity
- `<leader>z` - Toggle Zen Mode
- `<leader>Z` - Toggle Zoom
- `<leader>.` - Toggle Scratch Buffer
- `<leader>S` - Select Scratch Buffer

### Treesitter (`<leader>t`)
- `<leader>ts` - Toggle Syntax Highlighting
- `<leader>tp` - Treesitter Playground

### Quick Actions
- `<leader>q` - Quit
- `<leader>Q` - Quit All
- `<leader>w` - Save
- `<leader>W` - Save All
- `<leader>/` - Toggle Comment
- `K` - Hover Documentation
- `[d` / `]d` - Previous/Next Diagnostic

## 🛠️ Configuration

### Installation & Setup
Zero configuration required - just add and go:

```lua
{
  "jasoniq/ide.nvim",
  import = "ide.plugins",
  -- That's it! Auto-loads all features with sensible defaults
}
```

### Customization (Optional)
Override any plugin using lazy.nvim's standard pattern:

```lua
{
  "jasoniq/ide.nvim",
  import = "ide.plugins",
},

-- Light theme
{
  "catppuccin/nvim",
  opts = {
    flavour = "latte",
  },
},

-- Add language servers
{
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = { "lua_ls", "pyright", "tsserver" },
  },
},

-- Add language parsers
{
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "python", "javascript", "typescript" },
  },
},
```

## 📦 Included Plugins

### Core Foundation
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Lua utility functions
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless vim/tmux navigation

### UI & Navigation
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** - Modern UI components and utilities
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder and picker
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Interactive keymap help
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline
- **[catppuccin](https://github.com/catppuccin/nvim)** - Modern colorscheme

### Language Support
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP client configurations
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/DAP/linter installer
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** - Mason LSP integration
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting

### Refactoring & Code Quality  
- **[refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)** - Advanced refactoring operations
- **[telescope-refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)** - Telescope integration

### Professional Debugging
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** - Debug Adapter Protocol client
- **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** - Debug UI interface  
- **[nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)** - Inline variable display
- **[mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)** - Mason DAP integration
- **[telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim)** - Telescope DAP integration

## 🚀 Language Support

Out-of-the-box support for:
- **Lua** - Full LSP, debugging, and Neovim development
- **Python** - LSP, formatting, debugging with debugpy
- **JavaScript/TypeScript** - LSP, formatting, Node.js debugging
- **Go** - LSP support with Delve debugger
- **And many more** - Easily add any language via Mason

## 🎨 Customization

### Adding Languages
Languages are added automatically via Mason. To ensure specific ones are installed:

```lua
-- Override Mason configuration
{
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = { "lua_ls", "pyright", "tsserver", "gopls" }
  },
},

-- Override Treesitter configuration  
{
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "python", "javascript", "go" }
  },
},
```

### Custom Themes
```lua
-- Light catppuccin variant
{
  "catppuccin/nvim",
  opts = {
    flavour = "latte",
  },
},

-- Or completely different theme
{
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme tokyonight")
  end,
},
```

### Plugin Customization
Every plugin can be customized using lazy.nvim's standard `opts` table. See individual plugin documentation for available options.

## 🔧 Advanced Features

### Debug Workflow
- **Multi-language debugging** with automatic adapter installation
- **Visual debugging interface** with variable inspection
- **Professional breakpoint management** including conditional and log points
- **REPL integration** for interactive debugging sessions

### Refactoring Capabilities
- **Extract functions and variables** from selected code
- **Inline operations** to simplify code structure  
- **Block extraction** to separate files
- **Debug print management** for development workflow
- **Telescope integration** for command discovery

### Focus & Productivity
- **Zen mode** for distraction-free coding
- **Scratch buffers** for quick experimentation
- **Smart buffer management** preserving window layouts
- **Project-aware navigation** with recent files and git integration

## 📚 Philosophy & Design

This IDE configuration prioritizes:

1. **Editor Focus**: The code editor remains the primary interface
2. **Minimal Cognitive Load**: Features appear when needed, not always visible
3. **Professional Capability**: Enterprise-grade debugging and refactoring
4. **Consistent Experience**: All tools integrate seamlessly
5. **Performance**: Fast startup and responsive editing

The result is a development environment that feels like a natural extension of Neovim while providing the sophisticated tooling expected in modern software development.

## 🤝 Contributing

This configuration represents a curated, opinionated IDE setup. While customization is extensive, the core philosophy of minimal, focused, professional tooling should be maintained in any contributions.