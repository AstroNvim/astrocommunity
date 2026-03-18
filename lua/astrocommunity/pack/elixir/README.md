# Elixir Language Pack

**Requirements:** `elixir` and `mix` must be in your `PATH` and executable

This plugin does the following:

- Adds official [elixir-lang/expert](https://github.com/elixir-lang/expert) LSP.
- Adds `mix format` formatter via `conform.nvim`
- Adds `elixir`, `heex`, and `eex` Treesitter parsers

## Note 

Expert is registered manually at runtime because AstroNvim pins `nvim-lspconfig` to a version predating `lsp/expert.lua`.

This pack uses [Expert](https://expert-lsp.org), the **official** Elixir language server maintained under `elixir-lang`. It is currently in [release candidate stage](https://github.com/elixir-lang/expert/milestone/1).
