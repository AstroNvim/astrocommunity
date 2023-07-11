return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = { "smoka7/hydra.nvim" },
  opts = {},
  keys = {
    {
      "<Leader>m",
      "<cmd>MCstart<cr>",
      desc = "Create a selection for word under the cursor",
    },
  },
}
