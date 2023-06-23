local prefix = "<leader><leader>"
local term_string = vim.fn.exists "$TMUX" == 1 and "tmux" or "terminal"
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "Harpoon" },
  keys = {
    { prefix, function() end, desc = (vim.g.icons_enabled and "󱡀 " or "") .. "Harpoon" },
    { prefix .. "a", function() require("harpoon.mark").add_file() end, desc = "Add file" },
    { prefix .. "e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
    {
      "<C-x>",
      function()
        vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
          local num = tonumber(input)
          if num then require("harpoon.ui").nav_file(num) end
        end)
      end,
      desc = "Goto index of mark",
    },
    { "<C-p>", function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" },
    { "<C-n>", function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" },
    { prefix .. "m", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
    {
      prefix .. "t",
      function()
        vim.ui.input({ prompt = term_string .. " window number: " }, function(input)
          local num = tonumber(input)
          if num then require("harpoon." .. term_string).gotoTerminal(num) end
        end)
      end,
      desc = "Go to " .. term_string .. " window",
    },
  },
}
