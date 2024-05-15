return {
  "jedrzejboczar/toggletasks.nvim",
  lazy = true,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "akinsho/toggleterm.nvim" },
    { "nvim-telescope/telescope.nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>tss"] = { "<Cmd>Telescope toggletasks spawn<CR>", desc = "toggletasks: spawn" },
            ["<Leader>tsc"] = { "<Cmd>Telescope toggletasks select<CR>", desc = "toggletasks: select" },
            ["<Leader>tse"] = { "<Cmd>Telescope toggletasks edit<CR>", desc = "toggletasks: edit config" },
          },
        },
      },
    },
  },
  opts = {},
  init = function()
    require("astrocore").on_load("telescope.nvim", function() require("telescope").load_extension "toggletasks" end)
  end,
}
