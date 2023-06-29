return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "andymass/vim-matchup" },
  init = function() vim.g.matchup_matchparen_offscreen = { method = "popup" } end,
  opts = { matchup = { enable = true } },
}
