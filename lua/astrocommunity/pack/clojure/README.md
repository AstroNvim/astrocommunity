# Clojure Language Pack

Requires:

- Java Development Kit, e.g. `JDK-17`
- [Clojure CLI](https://clojure.org/guides/install_clojure) or [Leiningen](https://leiningen.org/)

This plugin pack does the following:

- Adds `clojure` treesitter parsers
- Adds `clojure_ls` language server
- Adds [Olical/conjure](https://github.com/Olical/conjure) and [gpanders/nvim-parinfer](https://github.com/gpanders/nvim-parinfer) plugins
- Add autocmd to disable lsp diagnostics in Conjure log
- Add autocmd to configure comments to Clojure style guide

## Additional Config

Add a localleader mapping to the user config (if not defined in AstroNvim) to enable Conjure key mappings, e.g. `, e r` to evaluate top level root

Define a localleader mapping in `options.lua`

```lua
return {
  g = {
    mapleader = " ",                 -- sets vim.g.mapleader
    maplocalleader = ",",            -- Set local leader key binding
    -- additional options...
  },
}
```

## Clojure Guides

`:ConjureSchool` in a Clojure buffer runs an interactive tutorial for Conjure

- [Clojure.org](https://clojure.org/index) API reference and guides
- [Conjure - Clojure guide](https://github.com/Olical/conjure/wiki/Quick-start:-Clojure)
- [Practicalli Neovim](https://practical.li/neovim/) Clojure development workflow
