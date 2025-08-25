return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = function(_, opts)
    return require("indent-rainbowline").make_opts(opts, require("astrocore").plugin_opts "indent-rainbowline.nvim")
  end,
  dependencies = { "TheGLander/indent-rainbowline.nvim" },
}
