return {
  "yetone/avante.nvim",
  build = ":AvanteBuild",
  cmd = {
    "AvanteAsk",
    "AvanteBuild",
    "AvanteConflictChooseAllTheirs",
    "AvanteConflictChooseBase",
    "AvanteConflictChooseBoth",
    "AvanteConflictChooseCursor",
    "AvanteConflictChooseNone",
    "AvanteConflictChooseOurs",
    "AvanteConflictChooseTheirs",
    "AvanteConflictListQf",
    "AvanteConflictNextConflict",
    "AvanteConflictPrevConflict",
    "AvanteEdit",
    "AvanteRefresh",
    "AvanteSwitchProvider",
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>a"

        maps.n[prefix] = { desc = "Avante functionalities" }

        maps.n[prefix .. "a"] = { function() require("avante.api").ask() end, desc = "Avante ask" }
        maps.v[prefix .. "a"] = { function() require("avante.api").ask() end, desc = "Avante ask" }

        maps.v[prefix .. "r"] = { function() require("avante.api").refresh() end, desc = "Avante refresh" }

        maps.n[prefix .. "e"] = { function() require("avante.api").edit() end, desc = "Avante edit" }
        maps.v[prefix .. "e"] = { function() require("avante.api").edit() end, desc = "Avante edit" }
      end,
    },
    -- optional dependencies
    "echasnovski/mini.icons", -- or "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to setup it properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {},
}
