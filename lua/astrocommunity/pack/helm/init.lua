return {
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

      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "gotmpl")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "helm_ls")

      local configs = require "lspconfig.configs"
      local lspconfig = require "lspconfig"
      local util = require "lspconfig.util"

      if not configs.helm_ls then
        configs.helm_ls = {
          default_config = {
            cmd = { "helm_ls", "serve" },
            filetypes = { "helm" },
            root_dir = function(fname) return util.root_pattern "Chart.yaml"(fname) end,
          },
        }
      end

      lspconfig.helm_ls.setup {
        filetypes = { "helm" },
        cmd = { "helm_ls", "serve" },
      }
    end,
  },
  {
    "towolf/vim-helm",
    init = function()
      local function helm_ft(path, _)
        -- check if file is in templates folder or is helmfile
        local path_regex = vim.regex "/templates/*\\.(tpl|yaml)$|*.gotmpl|helmfile*.yaml"
        if path_regex and path_regex:match_str(path) then return "helm" end

        -- return yaml if nothing else
        return "yaml"
      end

      vim.filetype.add {
        extension = {
          yaml = helm_ft,
        },
      }
    end,
    ft = "helm",
  },
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
