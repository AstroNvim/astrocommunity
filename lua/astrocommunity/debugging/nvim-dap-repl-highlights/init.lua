return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "LiadOz/nvim-dap-repl-highlights",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },
  opts = function(_, opts)
    if opts.ensure_installed ~= "all" then
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "dap_repl" })
    end
  end,
}
