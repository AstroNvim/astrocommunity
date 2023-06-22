return {
  "chrisgrieser/nvim-spider",
  keys = {
    { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "x", "o" } },
    { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "x", "o" } },
    { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "x", "o" } },
    { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "x", "o" } },
  },
  opts = {},
}
