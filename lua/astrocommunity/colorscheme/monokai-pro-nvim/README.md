# monokai-pro.nvim

Monokai Pro theme for Neovim written in Lua, with multiple filters: Pro, Classic, Machine, Octagon, Ristretto, Spectrum

**Repository:** <https://github.com/loctvl842/monokai-pro.nvim>

A professional theme for neovim. The following filters are available:

*   `pro`
*   `classic`
*   `machine`
*   `octagon`
*   `ristretto`
*   `spectrum`

By default, it is set to `pro`. To change the filter to, e.g., `machine`, you can add the following to your `user.lua`

```lua
{
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup {
        filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
    }
    end
},
```
