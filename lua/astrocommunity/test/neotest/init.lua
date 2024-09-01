local prefix = "<Leader>T"
local watch_prefix = prefix .. "W"

return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [prefix] = { desc = "󰗇 Tests" },
            [prefix .. "t"] = { function() require("neotest").run.run() end, desc = "Run test" },
            [prefix .. "d"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug test" },
            [prefix .. "f"] = {
              function() require("neotest").run.run(vim.fn.expand "%") end,
              desc = "Run all tests in file",
            },
            [prefix .. "p"] = {
              function() require("neotest").run.run(vim.fn.getcwd()) end,
              desc = "Run all tests in project",
            },
            [prefix .. "<CR>"] = { function() require("neotest").summary.toggle() end, desc = "Test Summary" },
            [prefix .. "o"] = { function() require("neotest").output.open() end, desc = "Output hover" },
            [prefix .. "O"] = { function() require("neotest").output_panel.toggle() end, desc = "Output window" },
            ["]T"] = { function() require("neotest").jump.next() end, desc = "Next test" },
            ["[T"] = { function() require("neotest").jump.prev() end, desc = "previous test" },

            [watch_prefix] = { desc = " Watch" },
            [watch_prefix .. "t"] = {
              function() require("neotest").watch.toggle() end,
              desc = "Toggle watch test",
            },
            [watch_prefix .. "f"] = {
              function() require("neotest").watch.toggle(vim.fn.expand "%") end,
              desc = "Toggle watch all test in file",
            },
            [watch_prefix .. "p"] = {
              function() require("neotest").watch.toggle(vim.fn.getcwd()) end,
              desc = "Toggle watch all tests in project",
            },
            [watch_prefix .. "S"] = {
              function()
                --- NOTE: The proper type of the argument is missing in the documentation
                ---@see https://github.com/nvim-neotest/neotest/blob/master/doc/neotest.txt#L626
                ---@diagnostic disable-next-line: missing-parameter
                require("neotest").watch.stop()
              end,
              desc = "Stop all watches",
            },
          },
        },
      },
    },
    {
      "folke/neodev.nvim",
      opts = function(_, opts)
        opts.library = opts.library or {}
        if opts.library.plugins ~= true then
          opts.library.plugins = require("astrocore").list_insert_unique(opts.library.plugins, { "neotest" })
        end
        opts.library.types = true
      end,
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { neotest = true } },
    },
  },
  config = function(_, opts)
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, vim.api.nvim_create_namespace "neotest")
    require("neotest").setup(opts)
  end,
}
