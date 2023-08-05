return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>P"] = { "<cmd>ProjectMgr<cr>", desc = "Open ProjectMgr panel" },
        },
      },
    },
  },
  {
    "charludo/projectmgr.nvim",
    event = "VeryLazy",
  },
}
