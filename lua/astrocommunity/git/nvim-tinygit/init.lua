return {
  "chrisgrieser/nvim-tinygit",
  ft = { "git_rebase", "gitcommit" }, -- so ftplugins are loaded
  dependencies = {
    "nvim-telescope/telescope.nvim",
    { "stevearc/dressing.nvim", optional = true },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>gn"] = { function() require("tinygit").smartCommit() end, desc = "New commit" },
            ["<Leader>gP"] = { function() require("tinygit").push { forceWithLease = true } end, desc = "Push" },
          },
        },
      },
    },
  },
  opts = {},
}
