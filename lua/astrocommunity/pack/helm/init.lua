return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = {
          yaml = function(path, _)
            -- check if file is in templates folder or is helmfile
            local path_regex = vim.regex "/templates/*\\.(tpl|yaml)$|*.gotmpl|helmfile*.yaml"
            if path_regex and path_regex:match_str(path) then return "helm" end

            -- return yaml if nothing else
            return "yaml"
          end,
        },
      },
    },
  },
  -- Helm support
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.gotmpl = {
        install_info = {
          url = "https://github.com/ngalaiko/tree-sitter-go-template",
          files = { "src/parser.c" },
          branch = "master",
        },
        filetype = "gotmpl",
      }
      vim.treesitter.language.register("gotmpl", "helm")

      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "gotmpl" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "helm_ls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "helm-ls" })
    end,
  },
  { "towolf/vim-helm", ft = "helm" },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        helm = { { "prettierd", "prettier" } },
      },
    },
  },
}
