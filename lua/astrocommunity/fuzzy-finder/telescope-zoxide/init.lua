return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "jvgrootveld/telescope-zoxide" },
  keys = {
    {
      "<leader>fz",
      "<cmd>Telescope zoxide list<CR>",
      desc = "Find directories",
    },
  },
  opts = function() require("telescope").load_extension "zoxide" end,
}
