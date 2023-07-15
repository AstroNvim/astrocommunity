return {
  "RRethy/vim-illuminate",
  event = "User AstroFile",
  opts = {},
  config = function(_, opts) require("illuminate").configure(opts) end,
}
