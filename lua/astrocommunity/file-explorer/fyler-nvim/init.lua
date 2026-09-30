return {
  { "nvim-neo-tree/neo-tree.nvim", optional = true, enabled = false },
  {
    "FylerOrg/fyler.nvim",
    version = "^2",
    dependencies = {
      "nvim-mini/mini.icons",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings or {}
          maps.n["<Leader>e"] = {
            function() require("fyler").toggle { kind = "split_left_most" } end,
            desc = "Toggle Explorer",
          }
          maps.n["<Leader>E"] = {
            function() require("fyler").toggle { kind = "floating" } end,
            desc = "Toggle Explorer (Floating)",
          }
        end,
      },
    },
    opts = {
      integrations = {
        icon = "mini_icons",
      },
      extensions = {
        git = {
          enabled = true,
          inline = false,
        },
      },
      use_as_default_explorer = true,
      kind_presets = {
        floating = {
          border = "rounded",
        },
      },
      ui = {
        indent_guides = true,
      },
    },
  },
}
