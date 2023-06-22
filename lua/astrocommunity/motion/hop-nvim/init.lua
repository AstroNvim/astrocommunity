return {
  "phaazon/hop.nvim",
  opts = {},
  keys = {
    {
      "s",
      function() require("hop").hint_words() end,
      mode = { "n" },
      desc = "Hop hint words",
    },
    {
      "<S-s>",
      function() require("hop").hint_lines() end,
      mode = { "n" },
      desc = "Hop hint lines",
    },
    {
      "s",
      function() require("hop").hint_words { extend_visual = true } end,
      mode = { "v" },
      desc = "Hop hint words",
    },
    {
      "<S-s>",
      function() require("hop").hint_lines { extend_visual = true } end,
      mode = { "v" },
      desc = "Hop hint lines",
    },
  },
}
