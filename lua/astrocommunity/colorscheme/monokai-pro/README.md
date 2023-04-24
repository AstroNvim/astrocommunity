# monokai-pro.nvim

**Repository:** https://github.com/loctvl842/monokai-pro.nvim

Monokai pro theme for neovim. The following filters are available:

- `classic`
- `octagon`
- `pro`
- `machine`
- `ristretto`
- `spectrum`

By default, it is set to `machine`. To change the filter, you can add the following to your `user.lua`

```lua
{
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup {
        filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
    }
    end
},
```
