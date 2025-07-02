return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = function(_, keys)
    local plugin = require("lazy.core.config").spec.plugins["kulala.nvim"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false) -- resolve mini.clue options
    if opts.global_keymaps_prefix then table.insert(keys, { opts.global_keymaps_prefix, desc = "Load KulalaNvim" }) end
    return keys
  end,
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
    global_keymaps_prefix = "<leader>r",
    lsp = { on_attach = function(...) return require("astrolsp").on_attach(...) end },
  },
  config = function(_, opts)
    require("kulala").setup(opts)
    if opts.global_keymaps_prefix then
      require("astrocore").set_mappings {
        n = {
          [opts.global_keymaps_prefix] = { desc = require("astroui").get_icon("KulalaNvim", 1, true) .. "KulalaNvim" },
        },
      }
    end
  end,
}
