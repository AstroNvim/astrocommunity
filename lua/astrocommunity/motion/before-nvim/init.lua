return {
  "bloznelis/before.nvim",
  event = { "InsertEnter", "TextChanged" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["]e"] = { function() require("before").jump_to_next_edit() end, desc = "Next edit" },
            ["[e"] = { function() require("before").jump_to_last_edit() end, desc = "Previous edit" },
          },
        },
      },
    },
  },
  opts = {},
}
