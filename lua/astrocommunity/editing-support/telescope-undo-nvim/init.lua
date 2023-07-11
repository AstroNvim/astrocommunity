return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "debugloop/telescope-undo.nvim" },
  keys = {
    {
      "<leader>fu",
      "<cmd>Telescope undo<CR>",
      desc = "Find undos",
    },
  },
  opts = function() require("telescope").load_extension "undo" end,
}
