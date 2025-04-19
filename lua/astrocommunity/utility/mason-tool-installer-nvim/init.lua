-- helper function to setup a plugin without an `ensure_installed` table
local setup_without_ensure_installed = function(main, opts)
  opts = vim.deepcopy(opts)
  opts.ensure_installed = nil
  require(main).setup(opts)
end

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  cmd = {
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonToolsUpdateSync",
    "MasonToolsClean",
  },
  dependencies = { "williamboman/mason.nvim" },
  init = function(plugin) require("astrocore").on_load("mason.nvim", plugin.name) end,
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {},
    integrations = { ["mason-lspconfig"] = false, ["mason-null-ls"] = false, ["mason-nvim-dap"] = false },
  },
  config = function(_, opts)
    local mason_tool_installer = require "mason-tool-installer"
    mason_tool_installer.setup(opts)
    if opts.run_on_start ~= false then mason_tool_installer.run_on_start() end
  end,
  specs = {
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
  },
}
