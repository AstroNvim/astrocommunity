return {
  "lukas-reineke/indent-blankline.nvim",
  event = "User AstroFile",
  main = "ibl",
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
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = {
        integrations = { indent_blankline = { enabled = true, scope_color = "text", colored_indent_levels = false } },
      },
    },
  },
}
