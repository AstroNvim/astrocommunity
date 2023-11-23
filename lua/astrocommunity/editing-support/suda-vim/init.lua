return {
  "lambdalisue/suda.vim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>W"] = { "<CMD>SudaWrite<CR>", desc = "Suda Write" },
          },
        },
      },
    },
  },
  cmd = { "SudaRead", "SudaWrite" },
}
