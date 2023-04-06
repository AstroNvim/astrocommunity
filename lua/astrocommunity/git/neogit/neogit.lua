return {
  {
    "TimUntersberger/neogit",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "User AstroGitFile",
    keys = {
      { "<leader>gn", desc = "Neogit", mode = { "n" } },
      { "<leader>gnt", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
      { "<leader>gnc", "<cmd>Neogit commit<CR>", desc = "Open Neogit Commit Page" },
      { "<leader>gnd", ":Neogit cwd=", desc = "Open Neogit Override CWD" },
      { "<leader>gnk", ":Neogit kind=", desc = "Open Neogit Override Kind" },
    },
  },
}
