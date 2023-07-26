return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>fy"] = { "<cmd>Telescope neoclip<cr>", desc = "Find yanks (neoclip)" },
        },
      },
    },
  },
  {
    "AckslD/nvim-neoclip.lua",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function(_, opts)
      require("neoclip").setup(opts)
      require("telescope").load_extension "neoclip"
    end,
  },
}
