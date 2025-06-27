local key_maps = {
  ["w"] = {
    "<Cmd>lua require('spider').motion('w')<CR>",
    desc = "Next word",
  },

  ["e"] = {
    "<Cmd>lua require('spider').motion('e')<CR>",
    desc = "Next end of word",
  },
  ["b"] = {
    "<Cmd>lua require('spider').motion('b')<CR>",
    desc = "Previous word",
  },
  ["ge"] = {
    "<Cmd>lua require('spider').motion('ge')<CR>",
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
    {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      opts = {
        rocks = { "luautf8" },
      },
    },
  },
  opts = {},
}
