return {
  {
    "neo-tree.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>e",
        function() require("mini.files").open() end,
        desc = "Explorer",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
