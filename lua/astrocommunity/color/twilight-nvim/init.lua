return {
  "folke/twilight.nvim",
  dependencies = {
    {
      "Astronvim/astrocore",
      opts = {
        mappings = {
          ["<Leader>uT"] = { "<CMD>Twilight<CR>", desc = "Toggle Twilight" },
        },
      },
    },
  },
  cmd = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
  },
}
