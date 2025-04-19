return {
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
}
