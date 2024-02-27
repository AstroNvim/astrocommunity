# TypeScript Language Pack

This plugin pack does the following:

- Adds `typescript`, `javascript`, `tsx`, and `jsdoc` Treesitter parsers
- Adds `tsserver` and `vscode-eslint` language server
- Adds `prettierd` formatter
- Adds [JSON language support](../json)
- Adds support for dap for JS
- Adds [typescript.nvim](https://github.com/jose-elias-alvarez/typescript.nvim) for language specific tooling
- Adds [package-info.nvim](https://github.com/vuki656/package-info.nvim) for project package management
- Adds [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) to handles file imports on rename or move within neo-tree

## How do I disable Eslint format on save?

To opt out of the Eslint format on save behaviour, you can disable the autocmd setup with the pack with this:

```lua
return {
  "AstroNvim/astrolsp",
  optional = true,
  opts = {
    autocmds = {
      eslint_fix_on_save = false,
    },
  },
}
```
