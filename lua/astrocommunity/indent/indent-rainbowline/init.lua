return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User AstroFile",
    opts = function() return require("indent-rainbowline").make_opts() end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },
}
