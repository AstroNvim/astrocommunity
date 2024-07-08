return {
  "LunarVim/bigfile.nvim",
  event = "BufReadPre",
  opts = {},
  specs = {
    {
      "AstroNvim/astrocore",
      opts = { features = { large_buf = false } } --[[@as AstroCoreOpts]],
    },
  },
}
