local prefix = "<leader><leader>"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󰛢 " or ""
maps.n[prefix] = { desc = icon .. "Grapple" }
require("astronvim.utils").set_mappings(maps)
return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  cmd = { "Grapple" },
  keys = {
    { prefix .. "a", "<cmd>Grapple tag<CR>", desc = "Add file" },
    { prefix .. "d", "<cmd>Grapple untag<CR>", desc = "Remove file" },
    { prefix .. "t", "<cmd>Grapple toggle<CR>", desc = "Toggle a file" },
    { prefix .. "e", "<cmd>Grapple toggle_tags<CR>", desc = "Select from tags" },
    { prefix .. "s", "<cmd>Grapple toggle_scopes<CR>", desc = "Select a scope" },
    { prefix .. "l", "<cmd>Grapple toggle_loaded<CR>", desc = "Select a loaded scope" },
    { prefix .. "x", "<cmd>Grapple reset<CR>", desc = "Clear tags from current project" },
    { "<C-n>", "<cmd>Grapple cycle forward<CR>", desc = "Select next tag" },
    { "<C-p>", "<cmd>Grapple cycle backward<CR>", desc = "Select previous tag" },
  },
}
