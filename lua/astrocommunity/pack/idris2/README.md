# idris Language Pack

This plugin pack does the following:

- Adds `idris` Treesitter parsers
- Adds `idris-language-server` language server
- Adds `purs-tidy` formatter

## How to install

```lua
return {
  { import = "astrocommunity.pack.idris" },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        idrisls = {
          settings = {
            idris = {
              formatter = "purs-tidy", -- add this to enable `purs-tidy` formatting on every save
            },
          },
        },
      },
    },
  },
}
```

## LSP Configuration

The default
[idris-language-server](https://github.com/nwolverson/idris-language-server)
configuration matches all [currently supported features for Neovim
LSP](https://github.com/nwolverson/idris-language-server?tab=readme-ov-file#neovims-built-in-language-server--nvim-lspconfig).
