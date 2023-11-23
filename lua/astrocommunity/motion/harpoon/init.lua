return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      { "AstroNvim/astroui", opts = { icons = { Harpoon = "󱡀" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local term_string = vim.fn.exists "$TMUX" == 1 and "tmux" or "terminal"
          local prefix = "<Leader><Leader>"
          maps.n[prefix] = { desc = require("astroui").get_icon("Harpoon", 1, true) .. "Harpoon" }

          maps.n[prefix .. "a"] = { function() require("harpoon.mark").add_file() end, desc = "Add file" }
          maps.n[prefix .. "e"] =
            { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" }
          maps.n["<C-x>"] = {
            function()
              vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
                local num = tonumber(input)
                if num then require("harpoon.ui").nav_file(num) end
              end)
            end,
            desc = "Goto index of mark",
          }
          maps.n["<C-p>"] = { function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" }
          maps.n["<C-n>"] = { function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" }
          maps.n[prefix .. "m"] = { "<CMD>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" }
          maps.n[prefix .. "t"] = {
            function()
              vim.ui.input({ prompt = term_string .. " window number: " }, function(input)
                local num = tonumber(input)
                if num then require("harpoon." .. term_string).gotoTerminal(num) end
              end)
            end,
            desc = "Go to " .. term_string .. " window",
          }
        end,
      },
    },
    cmd = { "Harpoon" },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { harpoon = true } },
  },
}
