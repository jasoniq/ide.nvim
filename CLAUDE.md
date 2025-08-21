# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim plugin collection called `ide.nvim` that provides IDE functionality. It's designed to work with LazyVim and follows a modular plugin architecture. The project focuses on minimal clutter while providing essential IDE features centered around the editor experience.

## Commands and Development

### Manual Testing
- Open Neovim and interact with plugin features directly
- For Treesitter language parser updates: Run `:TSUpdate` inside Neovim
- No build scripts, linting, or automated test suites are present

### Plugin Installation Testing
```lua
{
  "jasoniq/ide.nvim",
  import = "ide.plugins",
  config = function()
    require("ide.config").setup()
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
Each file in `lua/ide/plugins/` returns a LazyVim plugin specification:
- **core.lua**: Essential dependencies (plenary, vim-tmux-navigator)
- **snacks.lua**: Folke snacks with explorer, dashboard, and utilities
- **colorscheme.lua**: Catppuccin theme configuration
- **treesitter.lua**: Syntax highlighting with minimal default parsers
- **telescope.lua**: Fuzzy finder
- **folke-which-key.lua**: Key binding help

### Default Configuration
- **Indentation**: 2 spaces (expandtab enabled)
- **Colorscheme**: Catppuccin (configurable)
- **File Explorer**: Snacks explorer accessible via `<leader>e`
- **Key mappings**: Defined in `config/keymaps.lua` with descriptive names
- **Treesitter**: No language parsers installed by default (user must add via `ensure_installed`)

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
- Maintain the minimal-by-default philosophy (especially for Treesitter parsers)

### Keymap Conventions
- Define all keymaps in `config/keymaps.lua`
- Use descriptive `desc` fields for all mappings
- Follow the existing leader key patterns
- Group related functionality with consistent prefixes

## Important Notes

- This plugin collection prioritizes minimal clutter and editor-focused experience
- Treesitter language parsers are intentionally minimal by default
- The architecture supports easy extension through the modular plugin system
- All vim options and keymaps are centralized in the config directory