return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {},
  specs = {
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts) opts.statusline = nil end,
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = function()
        require("lualine").setup {
          options = {
            theme = "catppuccin",
          },
        }
      end,
    },
  },
}
