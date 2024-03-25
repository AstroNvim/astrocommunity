return {
  { import = "astrocommunity.git.diffview-nvim" }, -- optional dependency
  { import = "astrocommunity.git.nvim-tinygit" }, -- optional dependency
  {
    "SuperBo/fugit2.nvim",
    cmd = { "Fugit2", "Fugit2Graph" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "AstroNvim/astrocore",
        opts = { mappings = { n = {
          ["<Leader>gF"] = { "<Cmd>Fugit2<CR>", desc = "Fugit2" },
        } } },
      },
    },
    opts = {},
  },
}
