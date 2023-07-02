return {
  "petertriho/nvim-scrollbar",
  opts = {
    handlers = {
      gitsigns = require("astronvim.utils").is_available "gitsigns.nvim",
      search = require("astronvim.utils").is_available "nvim-hlslens",
      ale = require("astronvim.utils").is_available "ale",
    },
  },
  event = "User AstroFile",
}
