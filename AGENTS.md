# AGENTS.md

This repository is a Neovim plugin collection written in Lua for LazyVim-style setups. Agentic coding agents should follow these guidelines.

## Build, Lint, and Test
- No build pipeline or automated test suite is present.
- Manual testing is the primary validation method: open Neovim and exercise affected keymaps/plugins.
- For Treesitter parser updates, run `:TSUpdate` inside Neovim.
- Formatting conventions are defined in `.stylua.toml` (2-space indentation, max width 120).

## Project Structure
- Entry point: `lua/ide/init.lua`.
- Plugin spec aggregator: `lua/ide/plugins/init.lua`.
- Config module root: `lua/ide/config/init.lua`.
- Core options: `lua/ide/config/core/options.lua`.
- Keymaps: `lua/ide/config/bindings/keymaps.lua`.
- Plugin specs are organized by domain under:
  - `lua/ide/plugins/editor/`
  - `lua/ide/plugins/coding/`
  - `lua/ide/plugins/ui/`
  - `lua/ide/plugins/util/`

## Code Style Guidelines
- Use 2-space indentation.
- Use `require("...")` for module imports.
- Prefer lowercase with underscores for variables/functions.
- Use Lua annotations (`---@class`, `---@type`, etc.) when useful.
- Keep comments concise and relevant (`--` single-line comments).
- Follow Neovim/Lua conventions for error handling (minimal wrappers unless needed).

## Repo Conventions
- Keep keymap changes centralized in `lua/ide/config/bindings/keymaps.lua` with descriptive `desc` values.
- Keep core option changes in `lua/ide/config/core/options.lua`.
- Respect feature flags in `lua/ide/config/core/defaults.lua` when adding conditional plugin behavior.
- New plugin configuration should follow existing Lazy spec style and domain grouping.

## Additional Notes
- Plugins are managed via lazy.nvim/LazyVim import patterns.
- Prefer updating this file when repo structure or development workflow changes.
