# TypeScript Language Pack

This plugin pack does the following:

- Adds `typescript`, `javascript`, `tsx`, and `jsdoc` Treesitter parsers
- Adds `vtsls` and `eslint` language server
- Adds `prettierd` formatter
- Adds [JSON language support](../json)
- Adds support for dap for JS
- Adds [nvim-vtsls](https://github.com/yioneko/nvim-vtsls) for language specific tooling
- Adds [package-info.nvim](https://github.com/vuki656/package-info.nvim) for project package management
- Adds [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) to handles file imports on rename or move within neo-tree
- Adds [neotest-jest](https://github.com/nvim-neotest/neotest-jest) to ease the test running if `neotest` is installed

## How do I enable HTML and CSS support?

To enable HTML, CSS and Emmet support, you can add the `html-css` pack to your `community.lua` config:

```lua
{ import = "astrocommunity.pack.html-css" }
```

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

## How do I resolve double formatting issues with Prettier and ESLint?

If you experience double formatting or race conditions due to both `eslint_fix_on_save` and `prettierd` (via `conform.nvim`) formatting on save, you can resolve this by following one of these solutions:

### Solution 1: Disable `eslint_fix_on_save`
You can disable the `eslint_fix_on_save` autocmd in your configuration as mentioned above.

### Solution 2: Configure ESLint to Not Handle Formatting
Alternatively, you can configure your project's ESLint setup to avoid handling formatting altogether:
1. Use `eslint-config-prettier` in your ESLint configuration to disable rules that conflict with Prettier.
2. Optionally, remove `eslint-plugin-prettier` if it is only used for enforcing Prettier rules.

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
