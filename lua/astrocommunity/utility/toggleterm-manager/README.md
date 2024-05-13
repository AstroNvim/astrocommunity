# toggleterm-mamnager.nvim

Manage your toggleterm terminal buffers with telescope. Additional keybindings are added in the Telescope interface to

Key `<Leader>ts` is mapped to open the telescope interface.

Keymaps in the Telescope interface:

- `n` normal mode:
  - `<CR>`: toggle the selected terminal.
  - `r`: rename the selected terminal.
  - `d`: delete the selected terminal.
  - `n`: create a new terminal buffer
- `i` insert mode:
  - `<CR>`: toggle the selected terminal.
  - `<C-r>`: rename the selected terminal.
  - `<C-d>`: delete the selected terminal.
  - `<C-i>`: create a new terminal buffer

Dependencies:

- [akinsho/nvim-toggleterm.lua](https://github.com/akinsho/toggleterm.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

**Repository:** <https://github.com/ryanmsnyder/toggleterm-manager.nvim>
