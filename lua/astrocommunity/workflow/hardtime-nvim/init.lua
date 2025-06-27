return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  opts = {
    disabled_keys = {
      ["<Insert>"] = { "", "i" },
      ["<Home>"] = { "", "i" },
      ["<End>"] = { "", "i" },
      ["<PageUp>"] = { "", "i" },
      ["<PageDown>"] = { "", "i" },
    },
  },
  dependencies = { "MunifTanjim/nui.nvim" },
}
