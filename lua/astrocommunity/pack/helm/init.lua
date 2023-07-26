local utils = require "astrocore"
return {
  -- Helm support
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    dependencies = {
      {
        "ngalaiko/tree-sitter-go-template",
        config = function()
          require("nvim-treesitter.parsers").get_parser_configs().gotmpl = {
            install_info = {
              url = vim.fn.stdpath "data" .. "/lazy/tree-sitter-go-template",
              files = "src/parser.c",
            },
            filetype = "helm",
          }
        end,
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "helm_ls")

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
}
