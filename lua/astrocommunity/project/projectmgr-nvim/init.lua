return {
  "charludo/projectmgr.nvim",
  lazy = false, -- important!
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
}
