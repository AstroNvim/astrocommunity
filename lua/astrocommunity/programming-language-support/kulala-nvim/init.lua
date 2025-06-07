return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "http" })
        end
      end,
    },
  },
  specs = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = { icons = { KulalaNvim = "󱜿" } },
    },
  },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>R",
    lsp = { keymaps = true },
  },
  config = function(_, opts)
    require("kulala").setup(opts)
    require("astrocore").setup {
      mappings = {
        n = {
          [opts.global_keymaps_prefix] = { desc = require("astroui").get_icon("KulalaNvim", 1, true) .. "KulalaNvim" },
        },
      },
    }
  end,
}
