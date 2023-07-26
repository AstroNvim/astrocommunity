local key_maps = {
  ["w"] = {
    "<cmd>lua require('spider').motion('w')<CR>",
    desc = "Next word",
  },

  ["e"] = {
    "<cmd>lua require('spider').motion('e')<CR>",
    desc = "Next end of word",
  },
  ["b"] = {
    "<cmd>lua require('spider').motion('b')<CR>",
    desc = "Previous word",
  },
  ["ge"] = {
    "<cmd>lua require('spider').motion('ge')<CR>",
    desc = "Previous end of word",
  },
}

return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = key_maps,
        x = key_maps,
        o = key_maps,
      },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    opts = {},
  },
}
