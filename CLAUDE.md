# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim plugin collection called `ide.nvim` that provides IDE functionality. It's designed to work with LazyVim and follows a modular plugin architecture. The project focuses on minimal clutter while providing essential IDE features centered around the editor experience.

## Commands and Development

### Manual Testing
- Open Neovim and interact with plugin features directly
- For Tree-sitter language parser updates: Run `:TSManager` inside Neovim (uses Neovim 0.12+ core tree-sitter via tree-sitter-manager.nvim)
- No build scripts, linting, or automated test suites are present

### Plugin Installation Testing
```lua
{
  "jasoniq/ide.nvim",
  import = "ide.plugins",
  -- That's it! Auto-loads vim options, keymaps, and colorscheme
}
```

### Advanced Configuration (Optional)
```lua
{
  "jasoniq/ide.nvim",
  import = "ide.plugins",
  config = function()
    -- Optional: Override colorscheme or add custom options
    require("ide.config").setup({
      colorscheme = "your-theme",
    })
  end
}
```

## Architecture

### Core Structure
- **Entry Point**: `lua/ide/init.lua` - Main module setup with optional configuration
- **Configuration**: `lua/ide/config/` - Contains options, keymaps, and initialization logic
- **Plugins**: `lua/ide/plugins/` - Individual plugin configurations that return LazyVim specs

### Configuration System
The plugin uses a centralized config system in `lua/ide/config/init.lua`:
- Handles colorscheme setup (function or string-based)
- Loads vim options and keymaps
- Uses metatable for accessing configuration values
- Deep merges user options with sensible defaults

### Plugin Architecture
Each file in `lua/ide/plugins/` returns a LazyVim plugin specification, organized by domain:

**UI** (`lua/ide/plugins/ui/`):
- **snacks.lua**: Dashboard, notifications, zen mode, lazygit, bufdelete, animations
- **colorscheme.lua**: Catppuccin theme configuration
- **which-key.lua**: Keymap help and discovery
- **statusline.lua**: Lualine status bar with LSP status

**Editor** (`lua/ide/plugins/editor/`):
- **treesitter.lua**: Neovim 0.12+ core tree-sitter + tree-sitter-manager.nvim parser manager + nvim-ts-autotag (no parsers installed by default)
- **vim-tmux-navigator.lua**: Seamless tmux/vim split navigation

**Coding** (`lua/ide/plugins/coding/`):
- **lsp.lua**: LSP configuration with inlay hints enabled
- **completion.lua**: nvim-cmp completion engine with snippet support
- **mason.lua**: LSP/DAP package manager
- **refactoring.lua**: Code refactoring operations (lazy-loaded on keys)
- **dap.lua**: Debug Adapter Protocol (lazy-loaded on keys/cmd)

**Util** (`lua/ide/plugins/util/`):
- **telescope.lua**: Fuzzy finder with file browser extension

### Feature Flags
Plugins are conditionally loaded via feature flags in `lua/ide/config/core/defaults.lua`:
- `finder`, `keybind_help`, `syntax_highlighting`, `lsp`, `statusline`, `refactoring`, `debugging`
- All enabled by default; users can disable features to skip loading associated plugins
- Keymaps in `config/bindings/keymaps.lua` are gated behind the same flags

### Default Configuration
- **Indentation**: 2 spaces (expandtab enabled)
- **Colorscheme**: Catppuccin Mocha (configurable)
- **Inlay hints**: Enabled via LSP on_attach
- **Key mappings**: Defined in `config/bindings/keymaps.lua` with descriptive names
- **Tree-sitter**: No language parsers installed by default (user must add via `ensure_installed` in the `romus204/tree-sitter-manager.nvim` spec, or install interactively via `:TSManager`)
- **Terminal**: Not included — workflow relies on tmux + vim-tmux-navigator

## Code Style Guidelines

### Lua Conventions
- Use 2-space indentation
- Lowercase with underscores for variables/functions
- Use `require("...")` for module imports
- Use Lua annotations (`---@class`, `---@type`) for type information
- Keep comments concise with `--` for single-line comments

### Plugin Structure
- Each plugin file should return a valid LazyVim specification table
- Use descriptive configuration functions when setup is complex
- Follow the existing pattern of lazy loading and event triggers
- Maintain the minimal-by-default philosophy (especially for tree-sitter parsers)

### Keymap Conventions
- Define all keymaps in `config/keymaps.lua`
- Use descriptive `desc` fields for all mappings
- Follow the existing leader key patterns
- Group related functionality with consistent prefixes

## Important Notes

- This plugin collection prioritizes minimal clutter and editor-focused experience
- Tree-sitter language parsers are intentionally minimal by default
- The architecture supports easy extension through the modular plugin system
- All vim options and keymaps are centralized in the config directory