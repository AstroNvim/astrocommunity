return {
  "echasnovski/mini.basics",
  version = false,
  event = "User AstroFile",
  config = function(_, opts) require("mini.basics").setup(opts) end,
  opts = {
    mappings = {
      windows = true,
      move_with_alt = true,
    },
  },
}
