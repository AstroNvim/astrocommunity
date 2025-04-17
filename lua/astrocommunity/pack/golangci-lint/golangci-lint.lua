---@type LazySpec
return {
  { import = "astrocommunity.pack.go" },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      config = {
        -- Overrides the default config to support golangci-lint v2
        golangci_lint_ls = {
          init_options = {
            command = {
              "golangci-lint",
              "run",
              "--output.json.path",
              "stdout",
              "--show-stats=false",
              "--issues-exit-code=1",
            },
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "golangci-lint-langserver" })
    end,
  },
}
