# Swift Language Pack

Requires:

- [sourcekit-lsp](https://github.com/apple/sourcekit-lsp)

This plugin pack does the following:

- Adds `swift` Treesitter parsers
- Adds `sourcekit` in LSP servers
- Adds `sourcekit` in LSP config
- Adds `codelldb` for debugging

## SwiftLint and SwiftFormat

When it comes to linting and formatting, Swift is not standardized yet. Thus,
you need to set your favorite configuration in `user/null-ls.lua`. For example:

```lua
[...]
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.swiftformat, -- https://github.com/nicklockwood/SwiftFormat
      -- null_ls.builtins.formatting.swift_format, -- https://github.com/apple/swift-format

      -- Set a linter
      null_ls.builtins.diagnostics.swiftlint,
    }
[...]
```

Make sure to install [SwiftLint](https://github.com/realm/SwiftLint) and either
one of [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) **OR** [Apple's
Swift-Format](https://github.com/apple/swift-format).
