return {
  "OXY2DEV/helpview.nvim",
  ft = "help",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  specs = {
    {
      "AstroNvim/astrocore",
      optional = true,
      ---@type AstroCoreOpts
      opts = {
        treesitter = { ensure_installed = { "vimdoc" } },
      },
    },
  },
}
