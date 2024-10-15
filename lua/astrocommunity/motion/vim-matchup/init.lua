return {
  "andymass/vim-matchup",
  lazy = true,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            matchup_matchparen_pumvisible = 0,
            matchup_matchparen_nomode = "i",
            matchup_matchparen_deferred = 1,
            matchup_matchparen_offscreen = {
              method = "popup",
              fullwidth = 1,
              highlight = "Normal",
              syntax_hl = 1,
            },
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
