local utils = require "astronvim.utils"

return {
  "mfussenegger/nvim-dap",
  optional = true,
  config = function()
    local dap = require "dap"
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
            .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
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

    if not dap.configurations.javascript then
      dap.configurations.javascript = js_config
    else
      utils.extend_tbl(dap.configurations.javascript, js_config)
    end
  end,
}
