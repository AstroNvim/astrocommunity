# Just language pack

This plugin does the following:

- Adds `just` Treesitter parser: <https://github.com/IndianBoy42/tree-sitter-just>
- Adds `just-lsp`: <https://github.com/terror/just-lsp>
- Adds autocmds `just_as_make`: `:make` now calls just if there is justfile in workdir. And redirects the output to quickfix like make
