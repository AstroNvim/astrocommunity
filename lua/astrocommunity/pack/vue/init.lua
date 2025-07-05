return {
  { import = "astrocommunity.pack.typescript" },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
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
            on_init = function(client)
              client.handlers["tsserver/request"] = function(_, result, context)
                local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = "vtsls" }
                if #clients == 0 then
                  vim.notify(
                    "Could not found `vtsls` lsp client, vue_lsp would not work without it.",
                    vim.log.levels.ERROR
                  )
                  return
                end
                local ts_client = clients[1]

                local param = unpack(result)
                local id, command, payload = unpack(param)
                ts_client:exec_cmd({
                  title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                  command = "typescript.tsserverRequest",
                  arguments = {
                    command,
                    payload,
                  },
                }, { bufnr = context.bufnr }, function(_, r)
                  local response_data = { { id, r.body } }
                  client:notify("tsserver/response", response_data)
                end)
              end
            end,
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

              if registry.is_installed "vue-language-server" then
                local vue_plugin_config = {
                  name = "@vue/typescript-plugin",
                  location = vim.fn.expand "$MASON/packages/vue-language-server/node_modules/@vue/language-server",
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
        require("astrocore").list_insert_unique(opts.ensure_installed, { "vue-language-server", "js-debug-adapter" })
    end,
  },
}
