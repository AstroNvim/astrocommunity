return {
  {
    "linrongbin16/gitlinker.nvim",
    event = "BufRead",
    keys = {
      { "<leader>gy", "<cmd>GitLink<CR>", desc = "Git link copy", mode = { "n", "v" } },
      { "<leader>gz", "<cmd>GitLink!<CR>", desc = "Git link open", mode = { "n", "v" } },
    },
    opts = {},
  },
}
