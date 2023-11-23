local key_maps = {
  ["w"] = {
    "<CMD>lua require('spider').motion('w')<CR>",
    desc = "Next word",
  },

  ["e"] = {
    "<CMD>lua require('spider').motion('e')<CR>",
    desc = "Next end of word",
  },
  ["b"] = {
    "<CMD>lua require('spider').motion('b')<CR>",
    desc = "Previous word",
  },
  ["ge"] = {
    "<CMD>lua require('spider').motion('ge')<CR>",
    desc = "Previous end of word",
  },
}

return {
  "chrisgrieser/nvim-spider",
  dependencies = {
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
  },
  opts = {},
}
