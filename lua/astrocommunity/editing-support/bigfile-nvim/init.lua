return {
  {
    "AstroNvim/astrocore",
    opts = { features = { large_buf = false } } --[[@as AstroCoreOpts]],
  },
  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
