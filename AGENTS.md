# AGENTS.md

This repository is a Neovim plugin collection written in Lua, designed for use with LazyVim. Agentic coding agents should follow these guidelines:

## Build/Lint/Test
- No build or test scripts are present; plugins are loaded via Neovim.
- Manual testing: Open Neovim and interact with plugin features.
- For Treesitter updates: Run `:TSUpdate` inside Neovim.
- No explicit linter; follow Lua best practices for formatting and style.

## Code Style Guidelines
- **Indentation**: 2 spaces (see `core/options.lua`).
- **Imports**: Use `require("...")` for modules.
- **Naming**: Lowercase with underscores for variables/functions; PascalCase for classes/types.
- **Types**: Use Lua annotations (`---@class`, `---@type`) where helpful.
- **Comments**: Use `--` for single-line comments; keep comments concise and relevant.
- **Error Handling**: Minimal; rely on Neovim/Lua conventions.
- **Keymaps**: Define in `core/keymaps.lua` with descriptive names and comments.
- **Formatting**: Keep code clean, readable, and idiomatic to Lua/Neovim plugin standards.

## Additional Notes
- No Cursor or Copilot rules are present.
- Plugins are managed via LazyVim; see README.md for installation and configuration details.
