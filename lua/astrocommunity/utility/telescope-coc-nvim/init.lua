return {
  "fannheyward/telescope-coc.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "fannheyward/telescope-coc.nvim" },
      opts = function(_, opts)
        require("telescope").load_extension "coc"
        if not opts.extensions then opts.extensions = {} end
        opts.extensions.coc = {
          theme = "ivy",
          prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        }
      end,
    },
  },
}
