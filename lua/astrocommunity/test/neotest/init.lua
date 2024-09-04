---@type LazySpec
return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    { "AstroNvim/astroui", opts = { icons = { Tests = "󰗇" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings

        local prefix = "<Leader>T"

        maps.n[prefix] = {
          desc = require("astroui").get_icon("Tests", 1, true) .. "Tests",
        }
        maps.n[prefix .. "t"] = {
          function() require("neotest").run.run() end,
          desc = "Run test",
        }
        maps.n[prefix .. "d"] = {
          function() require("neotest").run.run { strategy = "dap" } end,
          desc = "Debug test",
        }
        maps.n[prefix .. "f"] = {
          function() require("neotest").run.run(vim.fn.expand "%") end,
          desc = "Run all tests in file",
        }
        maps.n[prefix .. "p"] = {
          function() require("neotest").run.run(vim.fn.getcwd()) end,
          desc = "Run all tests in project",
        }
        maps.n[prefix .. "<CR>"] = {
          function() require("neotest").summary.toggle() end,
          desc = "Test Summary",
        }
        maps.n[prefix .. "o"] = {
          function() require("neotest").output.open() end,
          desc = "Output hover",
        }
        maps.n[prefix .. "O"] = {
          function() require("neotest").output_panel.toggle() end,
          desc = "Output window",
        }
        maps.n["]T"] = {
          function() require("neotest").jump.next() end,
          desc = "Next test",
        }
        maps.n["[T"] = {
          function() require("neotest").jump.prev() end,
          desc = "Previous test",
        }
      end,
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
