return {
  { import = "astrocommunity.pack.typescript" },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = function(_, opts)
      local astrocore = require "astrocore"
      local vtsls_ft = astrocore.list_insert_unique(vim.tbl_get(opts, "config", "vtsls", "filetypes") or {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      }, { "vue" })
      return astrocore.extend_tbl(opts, {
        ---@diagnostic disable: missing-fields
        config = {
          volar = {
            init_options = {
              vue = {
                hybridMode = true,
              },
            },
          },
          vtsls = {
            filetypes = vtsls_ft,
            settings = {
              vtsls = {
                tsserver = {
                  globalPlugins = {},
                },
              },
            },
            before_init = function(_, config)
              local registry_ok, registry = pcall(require, "mason-registry")
              if not registry_ok then return end
              local vuels = registry.get_package "vue-language-server"

              if vuels:is_installed() then
                local volar_install_path = vuels:get_install_path() .. "/node_modules/@vue/language-server"

                local vue_plugin_config = {
                  name = "@vue/typescript-plugin",
                  location = volar_install_path,
                  languages = { "vue" },
                  configNamespace = "typescript",
                  enableForWorkspaceTypeScriptVersions = true,
                }

                astrocore.list_insert_unique(config.settings.vtsls.tsserver.globalPlugins, { vue_plugin_config })
              end
            end,
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
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "vue" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "volar" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "js" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "vue-language-sever", "js-debug-adapter" })
    end,
  },
}
