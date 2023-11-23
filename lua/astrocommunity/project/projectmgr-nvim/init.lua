return {
  {
    "charludo/projectmgr.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>P"] = { "<CMD>ProjectMgr<CR>", desc = "Open ProjectMgr panel" },
            },
          },
        },
      },
    },
  },
}
