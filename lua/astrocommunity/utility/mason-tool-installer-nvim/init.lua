-- helper function to setup a plugin without an `ensure_installed` table
local setup_without_ensure_installed = function(main, opts)
  opts = vim.deepcopy(opts)
  opts.ensure_installed = nil
  require(main).setup(opts)
end

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    dependencies = { "williamboman/mason.nvim" },
    init = function(plugin) require("astrocore").on_load("mason.nvim", plugin.name) end,
    config = function(_, opts)
      -- integrate other installer plugins into mason-tool-installer
      if not opts.ensure_installed then opts.ensure_installed = {} end
      local target_lookup = {}
      for _, target in ipairs(opts.ensure_installed) do
        target_lookup[target] = true
      end
      for _, plugin in ipairs { "mason-nvim-dap.nvim", "mason-lspconfig.nvim", "mason-null-ls.nvim" } do
        for _, target in ipairs(require("astrocore").plugin_opts(plugin).ensure_installed or {}) do
          if not target_lookup[target] then table.insert(opts.ensure_installed, target) end
        end
      end
      local mason_tool_installer = require "mason-tool-installer"
      mason_tool_installer.setup(opts)
      mason_tool_installer.run_on_start()
    end,
  },
  -- disable init and ensure installed of other plugins
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    init = false,
    config = function(_, opts) setup_without_ensure_installed("mason-nvim-dap", opts) end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    init = false,
    config = function(_, opts) setup_without_ensure_installed("mason-lspconfig", opts) end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    init = false,
    config = function(_, opts) setup_without_ensure_installed("mason-null-ls", opts) end,
  },
}
