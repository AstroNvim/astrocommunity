# bracket-pair-colorizer

Provides rainbow indent guides that tie into their relevant bracket pairs, and a scope guide

**Repository:** <https://github.com/lukas-reineke/indent-blankline.nvim>
**Repository:** <https://gitlab.com/HiPhish/rainbow-delimiters.nvim>

Adds rainbow indent guides to all indents that also align with the bracket for a given indent if available.

Turns the bracket guide into a solid bold line when within the scope of a function/closure.

Adds new mappings to toggle lines & scope highlighting.

```lua
  ["<leader>uI"] = { ":IBLToggle<cr>", desc = "Toggle Rainbow Indents" },
  ["<leader>uO"] = { ":IBLToggleScope<cr>", desc = "Toggle Scope Highlights" },
```

Scope higlighting functionality can be disabled by adding this command into your `init.lua` or simliar config:

```lua
vim.cmd(":IBLDisableScope")
```

## Preview

![indent-colorizer-preview](https://github.com/ammuench/astrocommunity-rainbow-higlights/blob/main/lua/astrocommunity/indent/bracket-pair-colorizer/.readme/indent-colorizer-preview.png?raw=true)
