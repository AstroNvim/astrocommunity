return {
  "petertriho/nvim-scrollbar",
  opts = function(_, opts)
    require("astronvim.utils").extend_tbl(opts, {
      handlers = {
        gitsigns = require("astronvim.utils").is_available "gitsigns.nvim",
        search = require("astronvim.utils").is_available "nvim-hlslens",
        ale = require("astronvim.utils").is_available "ale",
      },
    })
  end,
  event = "User AstroFile",
}
