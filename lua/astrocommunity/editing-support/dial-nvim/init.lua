return {
  "monaqa/dial.nvim",
  keys = {
    -- Visual mode mappings
    {
      "<C-a>",
      mode = { "v" },
      function() return require("dial.map").manipulate("increment", "visual") end,
      expr = true,
      desc = "Increment",
    },
    {
      "<C-x>",
      mode = { "v" },
      function() return require("dial.map").manipulate("decrement", "visual") end,
      expr = true,
      desc = "Decrement",
    },
    {
      "g<C-a>",
      mode = { "v" },
      function() return require("dial.map").manipulate("increment", "gvisual") end,
      expr = true,
      desc = "Increment",
    },
    {
      "g<C-x>",
      mode = { "v" },
      function() return require("dial.map").manipulate("decrement", "gvisual") end,
      expr = true,
      desc = "Decrement",
    },
    -- Normal mode mappings
    {
      "<C-a>",
      function() return require("dial.map").manipulate("increment", "normal") end,
      expr = true,
      desc = "Increment",
    },
    {
      "<C-x>",
      function() return require("dial.map").manipulate("decrement", "normal") end,
      expr = true,
      desc = "Decrement",
    },
    {
      "g<C-a>",
      function() return require("dial.map").manipulate("increment", "gnormal") end,
      expr = true,
      desc = "Increment",
    },
    {
      "g<C-x>",
      function() return require("dial.map").manipulate("decrement", "gnormal") end,
      expr = true,
      desc = "Decrement",
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
