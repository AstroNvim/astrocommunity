# flash.nvim

`flash.nvim` lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.

**Repository:** <https://github.com/folke/flash.nvim>

## ✨ Features

- 🔍 **Search Integration**: integrate **flash.nvim** with your regular
  search using `/` or `?`. Labels appear next to the matches,
  allowing you to quickly jump to any location. Labels are
  guaranteed not to exist as a continuation of the search pattern.
- ⌨️ **type as many characters as you want** before using a jump label.
- ⚡ **Enhanced `f`, `t`, `F`, `T` motions**
- 🌳 **Treesitter Integration**: all parents of the Treesitter node
  under your cursor are highlighted with a label for quick selection
  of a specific Treesitter node.
- 🎯 **Jump Mode**: a standalone jumping mode similar to search
- 🔎 **Search Modes**: `exact`, `search` (regex), and `fuzzy` search modes
- 🪟 **Multi Window** jumping
- 🌐 **Remote Actions**: perform motions in remote locations
- ⚫ **dot-repeatable** jumps
- 📡 **highly extensible**: check the [examples](https://github.com/folke/flash.nvim#-examples)
