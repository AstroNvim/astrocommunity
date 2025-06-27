# TypeScript Language Pack

This plugin pack does the following:

- Adds `typescript`, `javascript`, `tsx`, and `jsdoc` Treesitter parsers
- Adds `vtsls` language server
- Adds [nvim-dap](https://github.com/mfussenegger/nvim-dap) support
- Adds [nvim-vtsls](https://github.com/yioneko/nvim-vtsls) for language specific tooling
- Adds [package-info.nvim](https://github.com/vuki656/package-info.nvim) for project package management
- Adds [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) to handles file imports on rename or move within neo-tree
- Adds [neotest-jest](https://github.com/nvim-neotest/neotest-jest) to ease the test running if `neotest` is installed
- Adds `gs` mapping for [goto_source_definition](https://github.com/yioneko/nvim-vtsls?tab=readme-ov-file#commands) instead of typings.

## How do I enable HTML and CSS support?

To enable HTML, CSS and Emmet support, you can add the `html-css` pack to your `community.lua` config:

```lua
{ import = "astrocommunity.pack.html-css" }
```

## How do I customize `neotest-jest`?

To customize the `neotest-jest` plugin, you need to configure it like you would with any other plugin

> Learn more about the spec setup used by `lazy` [here](https://lazy.folke.io/spec#spec-setup).

```lua
---@type LazySpec
return {
  "nvim-neotest/neotest-jest",
  opts = function(_, opts)
    -- Add your opts
  end,
}
```
