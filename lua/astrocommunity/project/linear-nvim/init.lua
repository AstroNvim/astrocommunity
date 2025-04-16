return {
  "rmanocha/linear-nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>L"

        maps.n[prefix] = { desc = "Linear" }
        maps.n[prefix .. "l"] = {
          function() require("linear-nvim").show_assigned_issues() end,
          desc = "Show assigned issues",
        }
        maps.v[prefix .. "c"] = {
          function() require("linear-nvim").create_issue() end,
          desc = "Create issue",
        }
        maps.n[prefix .. "c"] = {
          function() require("linear-nvim").create_issue() end,
          desc = "Create issue",
        }
        maps.n[prefix .. "s"] = {
          function() require("linear-nvim").show_issue_details() end,
          desc = "Show issue details",
        }
      end,
    },
  },
  opts = {},
}
