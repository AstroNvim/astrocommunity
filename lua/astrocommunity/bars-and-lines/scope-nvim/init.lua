return {
  "tiagovla/scope.nvim",
  event = "VeryLazy",
  opts = function() require("telescope").load_extension "scope" end,
}
