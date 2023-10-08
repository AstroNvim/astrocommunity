return {
  "lukas-reineke/indent-blankline.nvim",
  event = "User AstroFile",
  opts = {
    indent = {
      char = "│",
    },
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy", "neo-tree" },
    },
    whitespace = {
      remove_blankline_trail = true,
    },
  },
}
