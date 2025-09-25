return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        filetypes = {
          pattern = {
            [".*/defaults/.*%.ya?ml"] = "yaml.ansible",
            [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
            [".*/playbook.*%.ya?ml"] = "yaml.ansible",
            [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
            [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
          },
        },
      })
    end,
  },
  { import = "astrocommunity.pack.yaml" },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ansible-lint" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "ansible-lint", "ansible-language-server" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ansiblels" })
    end,
  },
  { "pearofducks/ansible-vim", ft = "yaml.ansible" },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ansible = { "ansible_lint" },
      },
    },
  },
}
