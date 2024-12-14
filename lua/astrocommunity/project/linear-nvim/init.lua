return {
  "rmanocha/linear-nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>m"

        maps.n[prefix] = { desc = "Linear" }
        maps.n[prefix .. "m"] = {
          function() require("linear-nvim").show_assigned_issues() end,
          desc = "Show assigned issues",
        }
        maps.v[prefix .. "c"] = {
          function() require("linear-nvim").create_issue() end,
          desc = "Toggle local note",
        }
        maps.n[prefix .. "c"] = {
          function() require("linear-nvim").create_issue() end,
          desc = "Toggle local note",
        }
        maps.n[prefix .. "s"] = {
          function() require("linear-nvim").show_issue_details() end,
          desc = "Toggle local note",
        }
      end,
    },
  },
  opts = {},
}
