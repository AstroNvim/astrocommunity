return {
  "nvim-telescope/telescope-fzy-native.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-telescope/telescope-fzy-native.nvim" },
      opts = function() require("telescope").load_extension "fzy_native" end,
    },
    {
      "NeogitOrg/neogit",
      optional = true,
      opts = { telescope_sorter = function() return require("telescope").extensions.fzy_native.native_fzy_sorter() end },
    },
  },
}
