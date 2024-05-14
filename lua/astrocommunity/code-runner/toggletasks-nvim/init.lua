return {
  "jedrzejboczar/toggletasks.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "akinsho/toggleterm.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  opts = {},
  init = function() require("telescope").load_extension "toggletasks" end,
  keys = {
    { "<leader>tss", "<cmd>Telescope toggletasks spawn<CR>", desc = "toggletasks: spawn" },
    { "<leader>tsc", "<cmd>Telescope toggletasks select<CR>", desc = "toggletasks: select" },
    { "<leader>tse", "<cmd>Telescope toggletasks edit<CR>", desc = "toggletasks: edit config" },
  },
}
