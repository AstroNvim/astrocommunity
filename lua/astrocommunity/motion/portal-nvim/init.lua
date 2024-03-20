return {
  "cbochs/portal.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>o"] = { "<Cmd>Portal jumplist backward<CR>", desc = "Portal Jump backward" },
            ["<Leader>i"] = { "<Cmd>Portal jumplist forward<CR>", desc = "Portal Jump forward" },
          },
        },
      },
    },
  },
  cmd = "Portal",
  opts = {},
}
