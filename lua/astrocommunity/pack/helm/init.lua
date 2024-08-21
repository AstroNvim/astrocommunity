return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local is_helm_file = function(path)
        local check = vim.fs.find("Chart.yaml", { path = vim.fs.dirname(path), upward = true })
        return not vim.tbl_isempty(check)
      end
      local yaml_filetype = function(path, _) return is_helm_file(path) and "helm.yaml" or "yaml" end
      local tmpl_filetype = function(path, _) return is_helm_file(path) and "helm.tmpl" or "template" end
      local tpl_filetype = function(path, _) return is_helm_file(path) and "helm.tmpl" or "smarty" end

      return require("astrocore").extend_tbl(opts, {
        autocmds = {
          helm_commentstring = {
            {
              event = "FileType",
              pattern = "helm",
              callback = function() vim.opt_local.commentstring = "{{/* %s */}}" end,
            },
          },
        },
        filetypes = {
          extension = {
            gotmpl = "helm",
            yaml = yaml_filetype,
            yml = yaml_filetype,
            tmpl = tmpl_filetype,
            tpl = tpl_filetype,
          },
          filename = {
            ["Chart.yaml"] = "yaml",
            ["Chart.lock"] = "yaml",
          },
          pattern = {
            ["helmfile.*%.ya?ml"] = "helm",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "helm" })
      end
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
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        helm = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
