-- Main plugin index that imports all organized plugin categories
return {
  { import = "ide.plugins.core" },
  { import = "ide.plugins.ui" },
  { import = "ide.plugins.editing" },
  { import = "ide.plugins.search" },
}