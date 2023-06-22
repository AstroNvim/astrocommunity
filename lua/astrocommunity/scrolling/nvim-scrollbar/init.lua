return {
  "petertriho/nvim-scrollbar",
  opts = {
    handlers = {
      gitsigns = require("astronvim.utils").is_available "gitsigns",
      search = require("astronvim.utils").is_available "hlslens",
      ale = require("astronvim.utils").is_available "ale",
    },
  },
  event = "User AstroFile",
}
