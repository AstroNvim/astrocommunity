-- Julia language server may be setup manually to use local system images. We should ignore installing the package
-- from Mason if that's the case because it completely changes how the Julia Language Server works
local function julials_manually_setup()
  return vim.tbl_contains(vim.tbl_get(require("astrocore").plugin_opts "astrolsp", "servers") or {}, "julials")
end

return {
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.completion.cmp-latex-symbols" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julia" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      if not julials_manually_setup() then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julials" })
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      if not julials_manually_setup() then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "julia-lsp" })
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        julials = {
          settings = {
            -- use the same default settings as the Julia VS Code extension
            julia = {
              completionmode = "qualify",
              lint = { missingrefs = "none" },
              inlayHints = {
                static = {
                  enabled = false,
                  variableTypes = { enabled = true },
                },
              },
            },
          },
        },
      },
    },
  },
}
