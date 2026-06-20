return {
  { "nvim-neo-tree/neo-tree.nvim", optional = true, enabled = false },
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = {
      "nvim-mini/mini.icons",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings or {}
          maps.n["<Leader>e"] = {
            function() require("fyler").toggle { kind = "floating" } end,
            desc = "Open with fyler (floating)",
          }
        end,
      },
    },

    opts = {
      use_as_default_explorer = true,
      kind = "replace",
      kind_presets = {
        floating = { border = "rounded" },
      },
      ui = { indent_guides = true },
    },
  },
}
