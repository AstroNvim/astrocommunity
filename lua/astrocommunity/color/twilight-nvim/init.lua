return {
  {
    "Astronvim/astrocore",
    opts = {
      mappings = {
        ["<leader>uT"] = { "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
      },
    },
  },
  {
    "folke/twilight.nvim",
    cmd = {
      "Twilight",
      "TwilightEnable",
      "TwilightDisable",
    },
  },
}
