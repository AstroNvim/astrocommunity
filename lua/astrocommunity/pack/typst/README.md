# Typst Language Pack

This plugin pack does the following:

-   Add `typst,vim` for syntax
-   Add `typst_lsp` language server

if you want to use typst outside a git repository, typst_lsp cannot find `root_dir`, add the following setting to `lsp.config` in your nvim config

```lua
typst_lsp = function(opts)
  return {
    exportPdf = "onType", -- Choose onType, onSave or never.
    root_dir = require("lspconfig.util").root_pattern("README.md", ".git", "main.typ"),
  }
end,
```
