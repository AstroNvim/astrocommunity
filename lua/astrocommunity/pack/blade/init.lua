return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { pattern = { [".*%.blade%.php"] = "blade" } } },
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.config.blade = {
        cmd = { "laravel-dev-generators", "lsp" },
        filetypes = { "blade" },
        root_dir = function(fname) return require("lspconfig").util.find_git_ancestor(fname) end,
      }

      if vim.fn.executable "laravel-dev-generators" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "blade" })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "blade" })
      end
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "blade_formatter" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "blade-formatter" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
      },
    },
  },
}
