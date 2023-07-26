return {
  {
    "miversen33/netman.nvim",
    cmd = {
      "NmloadProvider",
      "Nmlogs",
      "Nmdelete",
      "Nmread",
      "Nmwrite",
    },
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "netman.nvim" },
    optional = true,
    opts = function(_, opts)
      opts.sources = require("astrocore").list_insert_unique(opts.sources, "netman.ui.neo-tree")
    end,
  },
}
