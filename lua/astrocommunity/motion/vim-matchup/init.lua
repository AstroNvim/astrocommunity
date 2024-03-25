return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "andymass/vim-matchup",
      dependencies = {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "Normal", syntax_hl = 1 },
            },
          },
        },
      },
    },
  },
  opts = { matchup = { enable = true } },
}
