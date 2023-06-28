return {
  "psliwka/vim-smoothie",
  event = "User AstroFile",
  init = function() vim.g.smoothie_remapped_commands = { "<C-D>", "<C-U>", "<PageDown>", "<PageUp>" } end,
}
