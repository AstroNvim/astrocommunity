return {
  { import = "astrocommunity.pack.xml" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "java" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "jdtls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "jdtls" })
    end,
  },
  {
    "nvim-java/nvim-java",
    lazy = true,
    opts = {},
    dependencies = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          handlers = {
            jdtls = function(server, opts)
              require("lazy").load { plugins = { "nvim-java" } }
              require("lspconfig")[server].setup(opts)
            end,
          },
        },
      },
    },
  },
}
