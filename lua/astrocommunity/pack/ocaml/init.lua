return {
  { import = "astrocommunity.pack.toml" },
  {
    "tjdevries/ocaml.nvim",
    lazy = false,
    build = function() require("ocaml").update() end,
    opts = {},
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "ocaml", "ocaml_interface", "ocamllex", "menhir" } },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ocamllsp" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ocaml-lsp" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
    opts = {
      config = {
        ocamllsp = {
          get_language_id = function(_, ftype) return ftype end,
        },
      },
    },
  },
}
