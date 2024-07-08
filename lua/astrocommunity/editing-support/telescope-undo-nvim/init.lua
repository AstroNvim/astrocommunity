return {
  "debugloop/telescope-undo.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "debugloop/telescope-undo.nvim",
        {
          "AstroNvim/astrocore",
          opts = {
            mappings = {
              n = {
                ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undos" },
              },
            },
          },
        },
      },
      opts = function() require("telescope").load_extension "undo" end,
    },
  },
}
