return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User AstroFile",
    opts = function(_, opts) return require("indent-rainbowline").make_opts(opts) end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },
}
