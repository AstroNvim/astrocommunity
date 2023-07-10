return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-fzy-native.nvim" },
  opts = function() require("telescope").load_extension "fzy_native" end,
}
