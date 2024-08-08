return {
  "stevearc/quicker.nvim",
  ft = "qf",
  specs = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        options = {
          opt = {
            -- allow lazy loading on quickfix opening
            quickfixtextfunc = "v:lua.require'quicker.display'.quickfixtextfunc",
          },
        },
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
