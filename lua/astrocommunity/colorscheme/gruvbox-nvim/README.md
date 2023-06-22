# gruvbox.nvim

Lua port of the most famous vim colorscheme

**Repository:** <https://github.com/ellisonleao/gruvbox.nvim>

A port of gruvbox community theme to lua with treesitter support!

To change options:

```lua
{
    "gruvbox.nvim",
    opts = {
      italic = {
        strings = true,
        comments = true,
        folds = true,
        operations = false,
      }
    }
}
```

Other options can be found in the official README: https://github.com/ellisonleao/gruvbox.nvim#configuration
