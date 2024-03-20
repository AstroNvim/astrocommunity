return {
  "lambdalisue/suda.vim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>W"] = { "<Cmd>SudaWrite<CR>", desc = "Suda Write" },
          },
        },
      },
    },
  },
  cmd = { "SudaRead", "SudaWrite" },
}
