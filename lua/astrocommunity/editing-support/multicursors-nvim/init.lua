return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>m"] = {
            "<cmd>MCstart<cr>",
            desc = "Create a selection for word under the cursor",
          },
        },
        v = {
          ["<leader>m"] = {
            "<cmd>MCstart<cr>",
            desc = "Create a selection for word under the cursor",
          },
        },
      },
    },
    {
      "smoka7/multicursors.nvim",
      event = "VeryLazy",
      dependencies = { "smoka7/hydra.nvim" },
      opts = {},
    },
  },
}
