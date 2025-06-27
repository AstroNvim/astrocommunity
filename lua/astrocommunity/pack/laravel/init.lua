return {
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.blade" },
  {
    "adalessa/laravel.nvim",
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    dependencies = {
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
      {
        "AstroNvim/astrocore",
        ---@param opts AstroCoreOpts
        opts = function(_, opts)
          local maps = assert(opts.mappings)
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
    opts = function(_, opts)
      local is_available = require("astrocore").is_available
      opts.features = {
        pickers = {
          enable = true,
          provider = (is_available "telescope.nvim" and "telescope")
            or (is_available "fzf-lua" and "fzf-lua")
            or (is_available "snacks.nvim" and "snacks")
            or "ui.select",
        },
      }
    end,
  },
  {
    "Bleksak/laravel-ide-helper.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        ---@param opts AstroCoreOpts
        opts = function(_, opts)
          local maps = assert(opts.mappings)
          local prefix = "<Leader>Li"
          maps.n[prefix] = { desc = require("astroui").get_icon("IdeHelper", 1, true) .. "Laravel Ide Helper" }

          maps.n[prefix .. "m"] = {
            function() require("laravel-ide-helper").generate_models(vim.fn.expand "%") end,
            desc = "Generate Model Info for current model",
          }
          maps.n[prefix .. "M"] = {
            function() require("laravel-ide-helper").generate_models() end,
            desc = "Generate Model Info for all models",
          }
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { IdeHelper = "󱚌" } } },
    },
  },
  {
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      { "hrsh7th/nvim-cmp", optional = true },
    },
    ft = { "blade", "php" },
  },
}
