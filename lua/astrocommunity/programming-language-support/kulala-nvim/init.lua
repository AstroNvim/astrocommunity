local prefix = "<Leader>R"

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
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n[prefix] = { desc = require("astroui").get_icon("KulalaNvim", 1, true) .. "KulalaNvim" }
      end,
    },
  },
  opts = {
    global_keymaps = true,
  },
}
