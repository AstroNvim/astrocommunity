-- NOTE:
-- On `main` after v2026.4.1 (commit ca4393dc, 2026-10-04), lean.nvim removed `lean.setup()`
-- in favor of `vim.g.lean_config`, and since v2026.4.1 (4f62922d) it uses native `vim.lsp.enable("leanls")`.
--
---@type LazySpec
return {
  {
    "Julian/lean.nvim",
    -- Load before `FileType lean` fires (instead of `ft = { "lean" }`) so
    -- `plugin/lean.lua` runs `vim.lsp.enable("leanls")` in time for the first buffer.
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },
    opts = {
      mappings = true,
    },
    -- Populate `vim.g.lean_config` in `init` rather than `config`, because lazy.nvim
    -- sources `plugin/lean.lua` (which reads `lean.config`) before `config()` runs.
    init = function(plugin)
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      vim.g.lean_config = vim.tbl_deep_extend("force", opts, vim.g.lean_config or {})
    end,
    -- Required no-op: without an explicit `config` function, setting `opts` makes
    -- lazy.nvim call `require("lean").setup(opts)`, which fails with
    -- "attempt to call field 'setup' (a nil value)" since `lean.setup()` was removed.
    config = function() end,
  },
}
