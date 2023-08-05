return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>fz"] = { "<cmd>Telescope zoxide list<CR>", desc = "Find directories" },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "jvgrootveld/telescope-zoxide" },
    opts = function() require("telescope").load_extension "zoxide" end,
  },
}
