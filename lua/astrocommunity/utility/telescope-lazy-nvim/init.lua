return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "tsakirist/telescope-lazy.nvim" },
  opts = function() require("telescope").load_extension "lazy" end,
}
