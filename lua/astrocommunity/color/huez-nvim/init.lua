return {
  "vague2k/huez.nvim",
  lazy = false,
  import = "huez-manager.import",
  dependencies = {
    "AstroNvim/astrocore",
    opts = function(_, opts) opts.mappings.n["<Leader>ft"][1] = "<Cmd>Huez<CR>" end,
  },
  opts = function(_, opts) opts.fallback = require("astrocore").plugin_opts("astroui").colorscheme end,
}
