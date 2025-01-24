return {
  "igorlfs/nvim-dap-view",
  lazy = true,
  opts = {},
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>d"] = vim.tbl_get(opts, "_map_sections", "d")
        maps.n["<Leader>dE"] = { function() require("dap-view").add_expr() end, desc = "Add expression" }
        maps.n["<Leader>du"] = { function() require("dap-view").toggle() end, desc = "Toggle Debugger UI" }
      end,
    },
    {
      "mfussenegger/nvim-dap",
      optional = true,
      dependencies = "igorlfs/nvim-dap-view",
      opts = function()
        local dap, dap_view = require "dap", require "dap-view"
        dap.listeners.after.event_initialized.dapview_config = function() dap_view.open() end
        dap.listeners.before.event_terminated.dapview_config = function() dap_view.close() end
        dap.listeners.before.event_exited.dapview_config = function() dap_view.close() end
      end,
    },
    { "rcarriga/nvim-dap-ui", enabled = false },
  },
}
