return {
  "monaqa/dial.nvim",
  keys = {
    -- Visual mode mappings
    {
      "<C-a>",
      mode = { "v" },
      function() require("dial.map").manipulate("increment", "visual") end,
      desc = "Increment",
    },
    {
      "<C-x>",
      mode = { "v" },
      function() require("dial.map").manipulate("decrement", "visual") end,
      desc = "Decrement",
    },
    {
      "g<C-a>",
      mode = { "v" },
      function() require("dial.map").manipulate("increment", "gvisual") end,
      desc = "Increment",
    },
    {
      "g<C-x>",
      mode = { "v" },
      function() require("dial.map").manipulate("decrement", "gvisual") end,
      desc = "Decrement",
    },
    -- Normal mode mappings
    {
      "<C-a>",
      function() require("dial.map").manipulate("increment", "normal") end,
      desc = "Increment",
    },
    {
      "<C-x>",
      function() require("dial.map").manipulate("decrement", "normal") end,
      desc = "Decrement",
    },
    {
      "g<C-a>",
      function() require("dial.map").manipulate("increment", "gnormal") end,
      desc = "Increment",
    },
    {
      "g<C-x>",
      function() require("dial.map").manipulate("decrement", "gnormal") end,
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
