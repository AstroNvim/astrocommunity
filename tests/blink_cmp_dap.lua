-- Run with local clones of AstroNvim, astrocore, lazy.nvim, blink.cmp (v1), blink.compat,
-- nvim-dap and cmp-dap in BLINK_DAP_TEST_PLUGINS:
-- BLINK_DAP_TEST_PLUGINS=/path/to/clones nvim --headless -u NONE -l tests/blink_cmp_dap.lua
local plugins = assert(vim.env.BLINK_DAP_TEST_PLUGINS, "set BLINK_DAP_TEST_PLUGINS to the dependency clone directory")
local root = vim.fn.tempname()
for _, name in ipairs { "config", "data", "state", "cache" } do
  vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end
vim.api.nvim_create_autocmd("VimLeavePre", { callback = function() vim.fn.delete(root, "rf") end })
local source = debug.getinfo(1, "S").source:sub(2)
local community = vim.fn.fnamemodify(source, ":p:h:h")
vim.opt.loadplugins = true
vim.opt.virtualedit = "onemore"
vim.opt.rtp:prepend(plugins .. "/lazy.nvim")
vim.opt.rtp:prepend(plugins .. "/AstroNvim")

local errors = {}
vim.notify = function(message, level)
  if level == vim.log.levels.ERROR then table.insert(errors, message) end
end

-- Provider configuration linked from https://github.com/AstroNvim/astrocommunity/issues/1397
-- Original: https://github.com/saghen/blink.cmp/issues/1319 (with the missing return added).
local dap_provider = {
  name = "dap",
  module = "blink.compat.source",
  enabled = function() return require("cmp_dap").is_dap_buffer() end,
}
local specs = {
  { dir = plugins .. "/AstroNvim", lazy = true },
  { dir = plugins .. "/astrocore", opts = { rooter = { enabled = false } } },
  {
    dir = plugins .. "/nvim-dap",
    dependencies = require("astronvim.plugins.dap").dependencies,
    config = function() end,
  },
  { dir = plugins .. "/cmp-dap", optional = true },
  { dir = plugins .. "/blink.compat", optional = true },
  { dir = plugins .. "/blink.cmp", opts = require("astronvim.plugins.blink").opts },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  { "rcarriga/nvim-dap-ui", enabled = false },
  { dir = community, lazy = true },
  { import = "astrocommunity.completion.blink-cmp" },
  {
    "saghen/blink.cmp",
    opts = {
      fuzzy = { implementation = "lua" },
      sources = { providers = { dap = dap_provider } },
    },
  },
}
require("lazy").setup(specs, {
  install = { missing = false },
  checker = { enabled = false },
  change_detection = { enabled = false },
  readme = { enabled = false },
  performance = { cache = { enabled = false } },
  lockfile = vim.fn.stdpath "state" .. "/blink-dap-lock.json",
})
require("lazy").load { plugins = { "blink.cmp", "nvim-dap" } }
assert(#errors == 0, table.concat(errors, "\n"))

local dap = require "dap"
local requests = 0
local session = {
  capabilities = { supportsCompletionsRequest = true },
  current_frame = { id = 42 },
  request = function(_, method, args, callback)
    assert(method == "completions")
    assert(args.frameId == 42 and args.text == "valu" and args.column == 5)
    requests = requests + 1
    callback(nil, { targets = { { label = "value", text = "value", type = "variable" } } })
  end,
}
dap.session = function() return session end
local sources = require "blink.cmp.sources.lib"
local config = require "blink.cmp.config"
for _, filetype in ipairs { "dap-repl", "dapui_watches", "dapui_hover" } do
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(bufnr)
  vim.bo.buftype = filetype == "dap-repl" and "prompt" or "nofile"
  vim.bo.filetype = filetype
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "valu" })
  vim.api.nvim_win_set_cursor(0, { 1, 4 })
  assert(config.enabled(), "completion is disabled for " .. filetype)
  assert(vim.tbl_contains(sources.get_enabled_provider_ids "default", "dap"), "DAP source missing for " .. filetype)
  local provider = sources.get_enabled_providers("default").dap
  assert(provider, "DAP provider disabled for " .. filetype)
  local response
  provider.module:get_completions({
    id = bufnr,
    bufnr = bufnr,
    cursor = { 1, 4 },
    line = "valu",
    trigger = { kind = "manual" },
  }, function(result) response = result end)
  assert(response and #response.items == 1 and response.items[1].label == "value", "adapter completion missing")
  print(filetype .. ": returned adapter completion value")
end
assert(requests == 3, "expected one adapter request per DAP buffer")
vim.bo.filetype = "lua"
vim.bo.buftype = "prompt"
assert(not dap_provider.enabled(), "DAP provider must be disabled outside DAP buffers")
assert(not config.enabled(), "unrelated prompt buffer must keep completion disabled")
assert(not vim.tbl_contains(sources.get_enabled_provider_ids "default", "dap"), "DAP source leaked to Lua buffers")
assert(#errors == 0, table.concat(errors, "\n"))
print "PASS: 3 DAP buffers complete, unrelated prompt stays disabled"
vim.cmd.qa()
