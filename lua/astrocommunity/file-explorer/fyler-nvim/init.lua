return {
  "A7Lavinraj/fyler.nvim",
  dependencies = {
    "echasnovski/mini.icons",
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
