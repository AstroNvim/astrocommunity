local prefix = "<leader><leader>"
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "Harpoon" },
  keys = {
    { prefix, desc = "Harpoon" },
    { prefix .. "a", function() require("harpoon.mark").add_file() end, desc = "Add file" },
    { prefix .. "e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
    { prefix .. "h", function() require("harpoon.ui").nav_next() end, desc = "Goto previous mark" },
    { prefix .. "l", function() require("harpoon.ui").nav_prev() end, desc = "Goto next mark" },
    { prefix .. "m", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope"},
    { prefix .. "t",
      function()
        local num = tonumber(vim.fn.input("GoTo terminal window number: "))
        require("harpoon.term").gotoTerminal(num)
      end,
      desc = "Goto to terminal window" 
    },
    { prefix .. "j",
      function()
        local num = tonumber(vim.fn.input("GoTo Tmux window number: "))
        require("harpoon.tmux").gotoTerminal(num)
      end,
      desc = "Goto to TMUX tmux window" 
    },
  },
}
