return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-undo.nvim" },
  opts = function() require("telescope").load_extension "undo" end,
}
