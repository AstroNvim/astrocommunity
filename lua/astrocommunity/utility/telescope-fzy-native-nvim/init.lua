return {
  { "nvim-telescope/telescope-fzy-native.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "telescope_dap" },
    opts = function() require("telescope").load_extension "fzy_native" end,
  },
}
