return {
  { import = "astrocommunity.pack.tailwindcss" },
  {
    "mason-org/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "elixirls" })
    end,
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = { ensure_installed = { "elixir", "heex" } },
    },
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      config = {
        tailwindcss = {
          init_options = {
            userLanguages = {
              heex = "html-eex",
              elixir = "html-eex",
            },
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  'class[:]\\s*"([^"]*)"',
                },
              },
            },
          },
        },
      },
    },
  },
}
