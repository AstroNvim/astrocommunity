local M = {}

function M.setup()
  vim.filetype.add {
    extension = {
      yaml = M.yaml_filetype,
      yml = M.yaml_filetype,
      tmpl = M.tmpl_filetype,
      tpl = M.tpl_filetype,
    },
    filename = {
      ["Chart.yaml"] = "yaml",
      ["Chart.lock"] = "yaml",
    },
  }
end

function M.is_helm_file(path)
  local check = vim.fs.find("Chart.yaml", { path = vim.fs.dirname(path), upward = true })
  return not vim.tbl_isempty(check)
end

--@private
--@return string
function M.yaml_filetype(path, _) return M.is_helm_file(path) and "helm.yaml" or "yaml" end

--@private
--@return string
function M.tmpl_filetype(path, _) return M.is_helm_file(path) and "helm.tmpl" or "template" end

--@private
--@return string
function M.tpl_filetype(path, _) return M.is_helm_file(path) and "helm.tmpl" or "smarty" end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
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
          yaml = M.yaml_filetype,
          yml = M.yaml_filetype,
          tmpl = M.tmpl_filetype,
          tpl = M.tpl_filetype,
        },
        filename = {
          ["Chart.yaml"] = "yaml",
          ["Chart.lock"] = "yaml",
        },
        pattern = {
          ["helmfile.*%.ya?ml"] = "helm",
        },
      },
    },
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
