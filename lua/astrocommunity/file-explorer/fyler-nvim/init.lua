return {
  "A7Lavinraj/fyler.nvim",
  dependencies = {
    "nvim-mini/mini.icons",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        maps.n["<Leader>y"] = { "<Cmd>Fyler<CR>", desc = "Fyler" }
      end,
    },
  },
  cmd = "Fyler",
  opts = {},
}
