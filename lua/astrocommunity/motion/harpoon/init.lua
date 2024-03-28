return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      { "AstroNvim/astroui", opts = { icons = { Harpoon = "󱡀" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local term_string = vim.fn.exists "$TMUX" == 1 and "tmux" or "term"
          local prefix = "<Leader><Leader>"
          maps.n[prefix] = { desc = require("astroui").get_icon("Harpoon", 1, true) .. "Harpoon" }

          maps.n[prefix .. "a"] = { function() require("harpoon"):list():append() end, desc = "Add file" }
          maps.n[prefix .. "e"] = {
            function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
            desc = "Toggle quick menu",
          }
          maps.n["<C-x>"] = {
            function()
              vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
                local num = tonumber(input)
                if num then require("harpoon"):list():select(num) end
              end)
            end,
            desc = "Goto index of mark",
          }
          maps.n["<C-p>"] = { function() require("harpoon"):list():prev() end, desc = "Goto previous mark" }
          maps.n["<C-n>"] = { function() require("harpoon"):list():next() end, desc = "Goto next mark" }
          maps.n[prefix .. "m"] = { "<Cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" }
          maps.n[prefix .. "t"] = {
            function()
              vim.ui.input({ prompt = term_string .. " window number: " }, function(input)
                local num = tonumber(input)
                if num then require("harpoon").term.gotoTerminal(num) end
              end)
            end,
            desc = "Go to " .. term_string .. " window",
          }
        end,
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { harpoon = true } },
  },
}
