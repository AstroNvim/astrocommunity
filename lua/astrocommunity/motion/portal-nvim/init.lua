return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>o"] = { "<cmd>Portal jumplist backward<cr>", desc = "Portal Jump backward" },
          ["<leader>i"] = { "<cmd>Portal jumplist forward<cr>", desc = "Portal Jump forward" },
        },
      },
    },
  },
  {
    "cbochs/portal.nvim",
    cmd = "Portal",
    opts = {},
  },
}
