return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local utils = require "astrocommunity"
      local is_helm_file = function(path)
        local check = vim.fs.find("Chart.yaml", { path = vim.fs.dirname(path), upward = true })
        return not vim.tbl_isempty(check)
      end
      local yaml_filetype = function(path, _) return is_helm_file(path) and "helm" or "yaml" end
      local tmpl_filetype = function(path, _) return is_helm_file(path) and "helm" or "template" end
      local tpl_filetype = function(path, _) return is_helm_file(path) and "helm" or "smarty" end

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
            yaml = utils.merge_filetype("yaml", vim.tbl_get(opts, "filetypes", "extension", "yaml"), yaml_filetype),
            yml = utils.merge_filetype("yaml", vim.tbl_get(opts, "filetypes", "extension", "yml"), yaml_filetype),
            tmpl = utils.merge_filetype("template", vim.tbl_get(opts, "filetypes", "extension", "tmpl"), tmpl_filetype),
            tpl = utils.merge_filetype("smarty", vim.tbl_get(opts, "filetypes", "extension", "tpl"), tpl_filetype),
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
}
