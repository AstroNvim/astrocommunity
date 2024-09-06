return {
  "stevearc/quicker.nvim",
  event = "VeryLazy",
  specs = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>xq"] = { function() require("quicker").toggle { focus = true } end, desc = "Toggle quickfix" },
            ["<Leader>xl"] = {
              function() require("quicker").toggle { focus = true, loclist = true } end,
              desc = "Toggle loclist",
            },
          },
        },
      },
    },
  },
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {
    keys = {
      {
        ">",
        function() require("quicker").expand { before = 2, after = 2, add_to_existing = true } end,
        desc = "Expand quickfix context",
      },
      {
        "<",
        function() require("quicker").collapse() end,
        desc = "Collapse quickfix context",
      },
    },
  },
}
