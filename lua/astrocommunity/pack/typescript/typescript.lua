local utils = require "astrocommunity.utils"
local events = require "neo-tree.events"
local function on_file_remove(args)
  local ts_clients = vim.lsp.get_active_clients { name = "tsserver" }
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

return {
  { import = "astrocommunity.pack.json" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the required file types to opts.ensure_installed.
      utils.list_insert_unique(opts.ensure_installed, { "javascript", "typescript", "tsx" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add tsserver to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, "tsserver")
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, "prettierd")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table.
      if not opts.ensure_installed then opts.ensure_installed = {} end
      -- Add to opts.ensure_installed using table.insert.
      utils.list_insert_unique(opts.ensure_installed, "js")
    end,
  },
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = true,
    event = "BufRead package.json",
  },
  {
    "mfussenegger/nvim-dap",
    ft = { "ts", "js", "tsx", "jsx" },
    enabled = true,
    dependencies = {
      {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
          {
            "microsoft/vscode-js-debug",
            -- FIXME: lua module not found for vscode-js-debug. use config func instead...
            config = function() end,
            build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
          },
        },
        opts = {
          debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
          -- adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
          adapters = { "pwa-node" },
        },
      },
      { "theHamsta/nvim-dap-virtual-text", config = true },
      { "rcarriga/nvim-dap-ui", config = true },
    },
    config = function()
      local dap = require "dap"

      local attach_process = {
        type = "pwa-node",
        request = "attach",
        name = "attach to process",
        processId = function(...) return require("dap.utils").pick_process(...) end,
        cwd = "${workspaceFolder}",
      }

      local attach_port = {
        name = "attach to port",
        type = "pwa-node",
        request = "attach",
        port = function() return vim.fn.input("Port: ", "9229") end,
        localRoot = function() return vim.fn.input("Local Root: ", vim.fn.getcwd()) end,
        remoteRoot = function() return vim.fn.input("Remote root: ", "/application") end,
        cwd = "${workspaceFolder}",
        envFile = "${workspaceFolder}/.env",
      }

      dap.configurations.javascript = {
        attach_port,
        attach_process,
        {
          type = "pwa-node",
          request = "launch",
          name = "launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.typescript = {
        attach_port,
        attach_process,
        {
          type = "pwa-node",
          request = "launch",
          name = "launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "ts-node",
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
          resolveSourceMapLocations = {
            "${workspaceFolder}/dist/**/*.js",
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
        },
      }
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver") end,
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = events.FILE_MOVED,
          handler = on_file_remove,
        },
        {
          event = events.FILE_RENAMED,
          handler = on_file_remove,
        },
      },
    },
  },
}
