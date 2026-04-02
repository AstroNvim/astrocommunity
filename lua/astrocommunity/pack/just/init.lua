return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = { just = "just" },
        filename = {
          justfile = "just",
          Justfile = "just",
          [".Justfile"] = "just",
          [".justfile"] = "just",
        },
      },
      treesitter = { ensure_installed = { "just" } },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "just-lsp" })
    end,
  },
}
