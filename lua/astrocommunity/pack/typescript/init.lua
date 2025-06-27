return {
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(
          opts.ensure_installed or {},
          { "javascript", "typescript", "tsx", "jsdoc" }
        )
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          gs = {
            function() require("vtsls").commands.goto_source_definition() end,
            desc = "Goto Source Definition (vtsls)",
            cond = function(client) return client.name == "vtsls" end,
          },
        },
      },
      ---@diagnostic disable: missing-fields
      config = {
        vtsls = {
          settings = {
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
            vtsls = {
              enableMoveToFileCodeAction = true,
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "vtsls" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "js" }) -- 'js' for js-debug-adapter
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "vtsls", "js-debug-adapter" })
    end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
  {
    "yioneko/nvim-vtsls",
    lazy = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          nvim_vtsls = {
            {
              event = "LspAttach",
              desc = "Load nvim-vtsls with vtsls",
              callback = function(args)
                if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "vtsls" then
                  require("vtsls")._on_attach(args.data.client_id, args.buf)
                  vim.api.nvim_del_augroup_by_name "nvim_vtsls"
                end
              end,
            },
          },
        },
      },
    },
    config = function(_, opts) require("vtsls").config(opts) end,
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = function(_, opts)
      if not opts.file then opts.file = {} end
      opts.file[".nvmrc"] = { glyph = "", hl = "MiniIconsGreen" }
      opts.file[".node-version"] = { glyph = "", hl = "MiniIconsGreen" }
      opts.file["package.json"] = { glyph = "", hl = "MiniIconsGreen" }
      opts.file["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" }
      opts.file["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" }
      opts.file["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" }
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { { "nvim-neotest/neotest-jest", config = function() end } },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-jest"(require("astrocore").plugin_opts "neotest-jest"))
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require "dap"
      if not dap.adapters["pwa-node"] then
        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = { command = vim.fn.exepath "js-debug-adapter", args = { "${port}" } },
        }
      end
      if not dap.adapters.node then
        dap.adapters.node = function(cb, config)
          if config.type == "node" then config.type = "pwa-node" end
          local pwa_adapter = dap.adapters["pwa-node"]
          if type(pwa_adapter) == "function" then
            pwa_adapter(cb, config)
          else
            cb(pwa_adapter)
          end
        end
      end

      local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
      local js_config = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }

      for _, language in ipairs(js_filetypes) do
        if not dap.configurations[language] then dap.configurations[language] = js_config end
      end

      local vscode_filetypes = require("dap.ext.vscode").type_to_filetypes
      vscode_filetypes["node"] = js_filetypes
      vscode_filetypes["pwa-node"] = js_filetypes
    end,
  },
}
