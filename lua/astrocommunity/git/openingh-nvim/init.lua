local prefix = "<Leader>g"
return {
  "almo7aya/openingh.nvim",
  cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
  keys = {
    { prefix .. "o", "<CMD>OpenInGHRepo<CR>", desc = "Open git repo in web", mode = { "n" } },
    { prefix .. "f", "<CMD>OpenInGHFile<CR>", desc = "Open git file in web", mode = { "n" } },
    { prefix .. "f", "<CMD>OpenInGHFileLines<CR>", desc = "Open git lines in web", mode = { "x" } },
  },
}
