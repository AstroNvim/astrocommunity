# Elm Language Pack

This plugin pack does the following:

- Adds `elm` Treesitter parsers
- Adds `elm-language-server` language server
- Adds `elm-format` formatter

## LSP Configuration

The default
[elm-language-server](https://github.com/elm-tooling/elm-language-server)
configuration matches all [currently supported features for Neovim
LSP](https://github.com/elm-tooling/elm-language-server#editor-support).

## A note on elm-test and elm-review

`elm-test` is not directly supported by [neo-test](../test/neotest) but it's
available via
[neotest-vim-test](https://github.com/nvim-neotest/neotest-vim-test).

However, it is common practice to peruse both `elm-test` and `elm-review`
directly via the command line.
