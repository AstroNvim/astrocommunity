return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>W"] = { "<cmd>SudaWrite<CR>", desc = "Suda Write" },
        },
      },
    },
  },
  {
    "lambdalisue/suda.vim",
    cmd = {
      "SudaRead",
      "SudaWrite",
    },
  },
}
