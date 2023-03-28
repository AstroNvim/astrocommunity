return {
  "arsham/indent-tools.nvim",
  dependencies = { "arsham/arshlib.nvim" },
  event = "User AstroFile",
  config = function() require("indent-tools").config {} end,
}
