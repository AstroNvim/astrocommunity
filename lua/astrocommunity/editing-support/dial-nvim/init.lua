return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        v = {
          ["<C-a>"] = {
            function() return require("dial.map").inc_visual() end,
            desc = "Increment",
          },
          ["<C-x>"] = {
            function() return require("dial.map").dec_visual() end,
            desc = "Decrement",
          },
          ["g<C-a>"] = {
            function() return require("dial.map").inc_gvisual() end,
            desc = "Increment",
          },

          ["g<C-x>"] = {
            function() return require("dial.map").dec_gvisual() end,
            desc = "Decrement",
          },
        },
        n = {
          ["<C-a>"] = {
            function() return require("dial.map").inc_normal() end,
            desc = "Increment",
          },
          ["<C-x>"] = {
            function() return require("dial.map").dec_normal() end,
            desc = "Decrement",
          },
        },
      },
    },
  },
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require "dial.augend"
      require("dial.config").augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.case.new {
            types = { "camelCase", "PascalCase", "snake_case", "SCREAMING_SNAKE_CASE" },
          },
        },
      }
    end,
  },
}
