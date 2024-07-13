return {
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.blade" },
  {
    "adalessa/laravel.nvim",
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>L"
          maps.n[prefix] = { desc = require("astroui").get_icon("Laravel", 1, true) .. "Laravel" }

          maps.n[prefix .. "a"] = { ":Laravel artisan<CR>", desc = "Artisan" }
          maps.n[prefix .. "r"] = { ":Laravel routes<CR>", desc = "Routes" }
          maps.n[prefix .. "c"] = { ":Composer<CR>", desc = "Composer" }
          maps.n[prefix .. "n"] = { ":Npm<CR>", desc = "Npm" }
          maps.n[prefix .. "y"] = { ":Yarn<CR>", desc = "Yarn" }
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { Laravel = "󰫐" } } },
    },

    event = { "VeryLazy" },
    config = true,
  },
}
