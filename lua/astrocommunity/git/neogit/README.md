# neogit

magit for neovim

**Repository:** <https://github.com/TimUntersberger/neogit>

A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy.


## Noice notification support

Neogit configuration checks if "nvim-notify" is available, otherwise disables Neogit notifications

When using noice, add an override to check for "noice-nvim"

```lua
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.git.neogit" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    },
    opts = {
      -- disable_builtin_notifications = false,
      disable_builtin_notifications = utils.is_available "noice-nvim",
    },
  },
```
