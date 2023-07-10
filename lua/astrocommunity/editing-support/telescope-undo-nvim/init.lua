return {
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "telescope_dap" },
    opts = function() require("telescope").load_extension "live_grep_args" end,
  },
}
