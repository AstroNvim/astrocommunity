return {
  "ray-x/sad.nvim",
  dependencies = { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  opts = {},
  event = "User AstroFile",
  cmd = { "Sad" },
}
