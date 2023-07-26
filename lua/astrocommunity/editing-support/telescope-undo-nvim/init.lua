return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        ["<leader>fu"] = { "<cmd>Telescope undo<CR>", desc = "Find undos" },
      },
    },
  },
  "nvim-telescope/telescope.nvim",
  dependencies = { "debugloop/telescope-undo.nvim" },
  opts = function() require("telescope").load_extension "undo" end,
}
