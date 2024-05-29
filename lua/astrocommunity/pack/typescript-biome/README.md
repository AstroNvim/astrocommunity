# TypeScript Biome Language Pack

This plugin pack does the following:

- Adds `typescript`, `javascript`, `tsx`, and `jsdoc` Treesitter parsers
- Adds `vtsls` and `biome` language server
- Adds [JSON language support](../json)
- Adds support for dap for JS
- Adds [nvim-vtsls](https://github.com/yioneko/nvim-vtsls) for language specific tooling
- Adds [package-info.nvim](https://github.com/vuki656/package-info.nvim) for project package management
- Adds [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) to handles file imports on rename or move within neo-tree

## How do I use biome without mason?

If you have biome as a dependency, then it's recommended to run the LSP through that dependency. This is because the biome linter and formatter
is prone to change between versions meaning your LSP can show different diagnostics compared to the actual version of biome you have installed.

```lua
return {
  "AstroNvim/astrolsp",
  servers = {
    "biome",
  },
  config = {
    biome = {
      -- Use the package manager of your project: npx, yarn, pnpm, bun...
      cmd = { "yarn", "biome", "lsp-proxy" }
    }
  }
}
```
