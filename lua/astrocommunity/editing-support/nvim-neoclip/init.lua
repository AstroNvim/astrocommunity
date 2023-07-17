return {
  "AckslD/nvim-neoclip.lua",
  event = { "User AstroFile" },
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("neoclip").setup()
    require("telescope").load_extension "neoclip"
  end,
  keys = {
    { "<leader>fy", "<cmd>Telescope neoclip<cr>", desc = "Find yanks (neoclip)" },
  },
}
