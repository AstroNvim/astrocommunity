return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "andymass/vim-matchup" },
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "Normal", syntax_hl = 1 }
  end,
  opts = { matchup = { enable = true } },
}
