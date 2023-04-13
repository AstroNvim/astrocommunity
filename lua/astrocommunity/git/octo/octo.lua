local prefix = "<leader>O"
return {
  "pwntester/octo.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "Octo" },
  keys = {
    { prefix, desc = "Octo" },
  },
  opts = {
    use_diagnostic_signs = true,
  },
}
