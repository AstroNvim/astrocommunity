return {
  "michaelb/sniprun",
  keys = {
    { "<Plug>SnipRun", mode = { "n", "v" } },
    "<Plug>SnipRunOperator",
    "<Plug>SnipInfo",
    "<Plug>SnipReset",
    "<Plug>SnipReplMemoryClean",
    "<Plug>SnipClose",
    "<Plug>SnipLive",
  },
  opts = {},
  build = "bash ./install.sh 1",
  cmd = "SnipRun",
}
