local prefix = "<leader>g"
return {
  "almo7aya/openingh.nvim",
  cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
  keys = {
    { prefix .. "o", "<cmd>OpenInGHRepo<CR>", desc = "Open git repo in web", mode = { "n" } },
    { prefix .. "f", "<cmd>OpenInGHFile<CR>", desc = "Open git file in web", mode = { "n" } },
    { prefix .. "f", "<cmd>OpenInGHFileLines<CR>", desc = "Open git lines in web", mode = { "x" } },
  },
}
