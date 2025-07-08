return {
  "andymass/vim-matchup",
  event = "User AstroFile",
  specs = {
    { "nvim-treesitter/nvim-treesitter", optional = true },
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
  },
}
