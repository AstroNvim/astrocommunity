return {
  "monaqa/dial.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          v = {
            ["<C-a>"] = {
              function() return require("dial.map").manipulate("increment", "visual") end,
              desc = "Increment",
            },
            ["<C-x>"] = {
              function() return require("dial.map").manipulate("decrement", "visual") end,
              desc = "Decrement",
            },
            ["g<C-a>"] = {
              function() return require("dial.map").manipulate("increment", "gvisual") end,
              desc = "Increment",
            },
            ["g<C-x>"] = {
              function() return require("dial.map").manipulate("decrement", "gvisual") end,
              desc = "Decrement",
            },
          },
          n = {
            ["<C-a>"] = {
              function() return require("dial.map").manipulate("increment", "normal") end,
              desc = "Increment",
            },
            ["<C-x>"] = {
              function() return require("dial.map").manipulate("decrement", "normal") end,
              desc = "Decrement",
            },
            ["g<C-a>"] = {
              function() return require("dial.map").manipulate("increment", "gnormal") end,
              desc = "Increment",
            },
            ["g<C-x>"] = {
              function() return require("dial.map").manipulate("decrement", "gnormal") end,
              desc = "Decrement",
            },
          },
        },
      },
    },
  },
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
}
