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
              ["<Leader>P"] = { "<Cmd>ProjectMgr<CR>", desc = "Open ProjectMgr panel" },
            },
          },
        },
      },
    },
  },
}
