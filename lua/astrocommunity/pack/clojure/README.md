# Clojure Language Pack

Include the Clojure language pack in the `lua/community.lua` file

```lua
  { import = "astrocommunity.pack.clojure" },
```

The Clojure pack requires:

- Java Development Kit, e.g. [Practicalli - Install Java host for Clojure](https://practical.li/clojure/install/java/)
- [Clojure CLI](https://clojure.org/guides/install_clojure) or [Leiningen](https://leiningen.org/)

The Clojure language pack includes:

- `clojure` treesitter parsers
- [clojure-lsp](https://clojure-lsp.io/) language server
- Clojure REPL client: [Olical/conjure](https://github.com/Olical/conjure)
- Structural editing: [parpar-nvim](https://github.com/dundalek/parpar.nvim) which provides both [nvim-parinfer](https://github.com/gpanders/nvim-parinfer) & [nvim-paredit](https://github.com/julienvincent/nvim-paredit)

> NOTE: Conjure is available as a [code-runner](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/code-runner) plugin config. nvim-paredit and nvim-parinfer are available as [editing-support plugin configurations](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/editing-support)

## Clojure Guides

`:ConjureSchool` in a Clojure buffer runs an interactive tutorial for Conjure

- [Clojure.org](https://clojure.org/index) API reference and guides
- [Conjure - Clojure guide](https://github.com/Olical/conjure/wiki/Quick-start:-Clojure)
- [Practicalli Neovim](https://practical.li/neovim/) Clojure development workflow and examples of [configuring Astrocommunity clojure pack](https://practical.li/neovim/configuration/astronvim/astrocommunity/)

## Override Configuration

Plugins in the language pack can be disabled and default options overridden.

Example: Include the Clojure language pack and disable the parinfer plugin by setting the `enabled` key to false.

```lua
  { import = "astrocommunity.pack.clojure" },
  { "gpanders/nvim-parinfer", enabled = false },
  { "julienvincent/nvim-paredit", enabled = false },
```

Example: Change the test runner used by Conjure. `clojure.test` runner is used by default

```lua
  { import = "astrocommunity.pack.clojure" },
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        g = {
          -- Set Test runner: "clojure", "clojurescript", "kaocha"
          ["conjure#client#clojure#nrepl#test#runner"] = "kaocha",
        },
      },
    },
  },
```

> NOTE: `:help conjure-client-clojure-nrepl` for full list of Conjure options for Clojure.
