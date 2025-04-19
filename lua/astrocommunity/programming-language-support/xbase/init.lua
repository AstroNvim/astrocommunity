return {
  "kkharji/xbase",
  ft = { "swift", "objcpp", "objc" },
  run = "make install",
  dependencies = {
    { "nvim-telescope/telescope.nvim", optional = true },
    { "nvim-lua/plenary.nvim", optional = true },
    { "stevearc/dressing.nvim", optional = true }, -- (in case you don't use telescope but something else)
  },
}
