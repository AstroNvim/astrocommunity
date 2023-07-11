return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "debugloop/telescope-undo.nvim" },
  opts = function() require("telescope").load_extension "undo" end,
}
