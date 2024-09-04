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

        -- the following key bindings do not have an official api implementation
        maps.n.co = { ":AvanteConflictChooseOurs<CR>", desc = "Choose ours" }
        maps.v.co = { ":AvanteConflictChooseOurs<CR>", desc = "Choose ours" }

        maps.n.ct = { ":AvanteConflictChooseTheirs<CR>", desc = "Choose theirs" }
        maps.v.ct = { ":AvanteConflictChooseTheirs<CR>", desc = "Choose theirs" }

        maps.n.ca = { ":AvanteConflictChooseAllTheirs<CR>", desc = "Choose all theirs" }
        maps.v.ca = { ":AvanteConflictChooseAllTheirs<CR>", desc = "Choose all theirs" }

        maps.n.c0 = { ":AvanteConflictChooseNone<CR>", desc = "Choose none" }
        maps.v.c0 = { ":AvanteConflictChooseNone<CR>", desc = "Choose none" }

        maps.n.cb = { ":AvanteConflictChooseBoth<CR>", desc = "Choose both" }
        maps.v.cb = { ":AvanteConflictChooseBoth<CR>", desc = "Choose both" }

        maps.n.cc = { ":AvanteConflictChooseCursor<CR>", desc = "Choose cursor" }
        maps.v.cc = { ":AvanteConflictChooseCursor<CR>", desc = "Choose cursor" }

        maps.n["]x"] = { ":AvanteConflictPrevConflict<CR>", desc = "Move to previous conflict" }
        maps.v["]x"] = { ":AvanteConflictPrevConflict<CR>", desc = "Move to previous conflict" }

        maps.n["[x"] = { ":AvanteConflictNextConflict<CR>", desc = "Move to next conflict" }
        maps.x["[x"] = { ":AvanteConflictNextConflict<CR>", desc = "Move to next conflict" }
      end,
    },
    -- optional dependencies
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
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
