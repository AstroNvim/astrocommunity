return {
  "vague2k/huez.nvim",
  lazy = false,
  import = "huez-manager.import",
  opts = function(_, opts) opts.fallback = require("astrocore").plugin_opts("astroui").colorscheme end,
}
