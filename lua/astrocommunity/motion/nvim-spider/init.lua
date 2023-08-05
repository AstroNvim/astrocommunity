return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "x", "o" },
      desc = "Next word",
    },
    {
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "x", "o" },
      desc = "Next end of word",
    },
    {
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "x", "o" },
      desc = "Previous word",
    },
    {
      "ge",
      "<cmd>lua require('spider').motion('ge')<CR>",
      mode = { "n", "x", "o" },
      desc = "Previous end of word",
    },
  },
  opts = {},
}
