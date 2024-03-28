return {
  "petertriho/nvim-scrollbar",
  opts = function(_, opts)
    require("astrocore").extend_tbl(opts, {
      handlers = {
        gitsigns = require("astrocore").is_available "gitsigns.nvim",
        search = require("astrocore").is_available "nvim-hlslens",
        ale = require("astrocore").is_available "ale",
      },
    })
  end,
  event = "User AstroFile",
}
