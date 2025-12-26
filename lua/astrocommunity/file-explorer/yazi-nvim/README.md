# yazi.nvim

Yazi is a blazing fast file manager for the terminal. This plugin allows you to open yazi in a floating window in Neovim.

## Requirements

- `yazi` installed on your system
- You can run `:checkhealth yazi` to validate your setup

## Notes

- This module does not disable `netrw` by default.
- If you set `open_for_directories = true` (open yazi when editing a directory), consider disabling netrw's plugin:

  ```lua
  init = function() vim.g.loaded_netrwPlugin = 1 end
  ```

**Repository:** <https://github.com/mikavilpas/yazi.nvim>
