# toggleterm-manager.nvim

A Telescope extension to manage Toggleterm's terminals in NeoVim

Key `<Leader>ts` is mapped to open the telescope interface.

Additionally added keymaps in the Telescope interface:

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

**Repository:** <https://github.com/ryanmsnyder/toggleterm-manager.nvim>
