local prefix = "<leader><leader>"
return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Harpoon" },
  keys = {
    { prefix, desc = "Harpoon" },
    { prefix .. "a", function() require("harpoon.mark").add_file() end, desc = "Add file" },
    { prefix .. "e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
    { "<C-k>", function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" },
    { "<C-j>", function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" },
  },
}
