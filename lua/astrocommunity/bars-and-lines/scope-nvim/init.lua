return {
  { "tiagovla/scope.nvim", event = "VeryLazy", opts = {} },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function() require("telescope").load_extension "scope" end,
  },
}
