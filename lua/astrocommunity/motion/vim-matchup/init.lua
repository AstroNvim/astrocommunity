return {
  "andymass/vim-matchup",
  lazy = true,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            matchup_matchparen_nomode = "i",
            matchup_matchparen_deferred = 1,
          },
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "andymass/vim-matchup" },
      opts = { matchup = { enable = true } },
    },
  },
}
