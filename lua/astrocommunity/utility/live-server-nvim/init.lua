return {
  "barrett-ruth/live-server.nvim",
  build = function()
    --- NOTE: Order of preference:
    --- bun / pnpm / yarn / npm
    local package_manager = vim.fn.executable "bun" and "bun"
      or vim.fn.executable "pnpm" and "pnpm"
      or vim.fn.executable "yarn" and "yarn"
      or vim.fn.executable "npm" and "npm"
      or false

    if not package_manager then
      error "Missing one of the following node.js package managers: bun, pnpm, yarn, or npm "
    end
    local cmd = string.format("%s install --frozen-lockfile", package_manager)
    vim.cmd(cmd)
  end,
  cmd = { "LiveServerStart", "LiveServerStop" },
  opts = {},
}
