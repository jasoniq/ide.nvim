-- Main plugin index that imports all organized plugin categories (LazyVim style)
return {
  { import = "ide.plugins.editor" },
  { import = "ide.plugins.coding" },
  { import = "ide.plugins.ui" },
  { import = "ide.plugins.util" },
}