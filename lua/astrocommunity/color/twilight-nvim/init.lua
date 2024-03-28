return {
  "folke/twilight.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uT"] = { "<Cmd>Twilight<CR>", desc = "Toggle Twilight" },
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
