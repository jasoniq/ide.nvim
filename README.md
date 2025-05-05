# ide.nvim
A collection of neovim plugins which provide IDE functionality based on my personal preferences

# Installation

This plugin is built to be loaded by Lazy but should work in other plugin managers.

 1. Set your prefered `<leader>` prefix
 2. Load the plugin with `lazy.nvim`

## [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "jasoniq/ide.nvim"
    import = "ide.plugins"
    config = function()
        require("ide.core")
    end
}
```
