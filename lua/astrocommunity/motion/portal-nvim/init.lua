return {
  "cbochs/portal.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>o"] = { "<CMD>Portal jumplist backward<CR>", desc = "Portal Jump backward" },
            ["<Leader>i"] = { "<CMD>Portal jumplist forward<CR>", desc = "Portal Jump forward" },
          },
        },
      },
    },
  },
  cmd = "Portal",
  opts = {},
}
