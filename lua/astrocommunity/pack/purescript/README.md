# purescript Language Pack

This plugin pack does the following:

- Adds `purescript` Treesitter parsers
- Adds `purescript-language-server` language server
- Adds `purs-tidy` formatter

## How to install

```lua
return {
  { import = "astrocommunity.pack.purescript" },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        purescriptls = {
          settings = {
            purescript = {
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
[purescript-language-server](https://github.com/nwolverson/purescript-language-server)
configuration matches all [currently supported features for Neovim
LSP](https://github.com/nwolverson/purescript-language-server?tab=readme-ov-file#neovims-built-in-language-server--nvim-lspconfig).
