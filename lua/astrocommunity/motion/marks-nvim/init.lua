return {
  "chentoast/marks.nvim",
  event = "BufEnter",
  opts = {
    excluded_filetypes = {
      "qf",
      "NvimTree",
      "toggleterm",
      "TelescopePrompt",
      "alpha",
      "netrw",
      "neo-tree",
    },
  },
}
