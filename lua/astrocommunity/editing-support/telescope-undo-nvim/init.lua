return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          ["<Leader>fu"] = { "<CMD>Telescope undo<CR>", desc = "Find undos" },
        },
      },
    },
  },
  opts = function() require("telescope").load_extension "undo" end,
}
