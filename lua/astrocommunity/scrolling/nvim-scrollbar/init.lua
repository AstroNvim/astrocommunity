return {
  "petertriho/nvim-scrollbar",
  opts = function(_, opts)
    require("astrocore.utils").extend_tbl(opts, {
      handlers = {
        gitsigns = require("astrocore.utils").is_available "gitsigns.nvim",
        search = require("astrocore.utils").is_available "nvim-hlslens",
        ale = require("astrocore.utils").is_available "ale",
      },
    })
  end,
  event = "User AstroFile",
}
