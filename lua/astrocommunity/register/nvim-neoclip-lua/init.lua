return {
  "AckslD/nvim-neoclip.lua",
  event = { "User AstroFile", "InsertEnter" },
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fy"] = { "<Cmd>Telescope neoclip<CR>", desc = "Find yanks (neoclip)" },
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("neoclip").setup(opts)
    require("telescope").load_extension "neoclip"
  end,
}
