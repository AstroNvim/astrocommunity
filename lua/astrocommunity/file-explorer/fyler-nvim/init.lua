return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "A7Lavinraj/fyler.nvim",
    dependencies = {
      "echasnovski/mini.icons",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings or {}
          maps.n["<Leader>e"] = {
            function() require("fyler").toggle { kind = "float" } end,
            desc = "Open with fyler (floating)",
          }
          opts.mappings = maps
        end,
      },
    },

    opts = {
      default_explorer = true,

      win = {
        border = "rounded",
        kind = "replace",
      },

      git_status = {
        enabled = true,
        symbols = {
          Modified = "●",
          Added = "✚",
          Deleted = "✖",
          Untracked = "★",
        },
      },

      mappings = {
        ["<Tab>"] = "Select",
      },

      indentscope = {
        marker = "┊",
      },
    },
  },
}
