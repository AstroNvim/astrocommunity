return {
  "mizlan/delimited.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["[d"][1] = function() require("delimited").goto_prev() end
        maps.n["]d"][1] = function() require("delimited").goto_next() end
      end,
    },
  },
  opts = {},
}
