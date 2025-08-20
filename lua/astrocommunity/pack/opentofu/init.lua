return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "terraform" })
      end
      vim.treesitter.language.register("terraform", "opentofu")
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = {
          tf = "opentofu",
          tofu = "opentofu",
          tfvars = "opentofu-vars",
        },
      },
    },
  },
  -- TODO: enable tofu_ls in AstroNvim v6 because it relies on the new vim.lsp.config
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "tofu_ls" })
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        opentofu = { "tofu_fmt" },
        ["opentofu-vars"] = { "tofu_fmt" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        opentofu = { "tofu" },
        ["opentofu-vars"] = { "tofu" },
      },
    },
  },
}
