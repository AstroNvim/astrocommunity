return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "andymass/vim-matchup" },
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    vim.g.matchup_matchparen_deferred = 1
  end,
  opts = { matchup = { enable = true } },
}
