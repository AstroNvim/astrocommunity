return {
  "folke/twilight.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uT"] = { "<CMD>Twilight<CR>", desc = "Toggle Twilight" },
          },
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
