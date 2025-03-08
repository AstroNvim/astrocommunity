# copilot.vim

Neovim plugin for GitHub Copilot

Check out the [documentation](https://github.com/github/copilot.vim/blob/release/doc/copilot.txt) for usage and key mappings.

It is possible to update `vim.g` copilot settings through AstroCore:

```lua
{
  "AstroNvim/astrocore",
  opts = {
    options = {
      g = {
        copilot_workspace_folders = { vim.fn.getcwd() },
        copilot_filetypes = {
          markdown = true,
        },
      },
    },
  },
}
```

**Repository:** <https://github.com/github/copilot.vim>
