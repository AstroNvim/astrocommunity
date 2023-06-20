local prefix = "<leader><leader>"
local dynamic_tmux_keymap_desc
local running_tmux_seesion = vim.fn.exists "$TMUX" == 1
if running_tmux_seesion then
  dynamic_tmux_keymap_desc = "Goto to TMUX window"
else
  dynamic_tmux_keymap_desc = "Goto to terminal window"
end
local icon
if vim.g.icons_enabled then icon = "󱡀 " else icon = "" end
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "Harpoon" },
  keys = {
    { prefix, function() end, desc = icon .. "Harpoon" },
    { prefix .. "a", function() require("harpoon.mark").add_file() end, desc = "Add file" },
    { prefix .. "e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
    { "<C-p>", function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" },
    { "<C-n>", function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" },
    { prefix .. "m", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
    {
      prefix .. "t",
      function()
        if running_tmux_seesion then
          local num = tonumber(vim.fn.input "GoTo Tmux window number: ")
          if num == nil then return end
          require("harpoon.tmux").gotoTerminal(num)
        else
          local num = tonumber(vim.fn.input "GoTo terminal window number: ")
          if num == nil then return end
          require("harpoon.term").gotoTerminal(num)
        end
      end,
      desc = dynamic_tmux_keymap_desc,
    },
  },
}
