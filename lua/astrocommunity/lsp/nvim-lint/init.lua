local lint -- cache for the nvim-lint package
---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  event = "User AstroFile",
  dependencies = { "williamboman/mason.nvim" },
  specs = {
    { "jay-babu/mason-null-ls.nvim", optional = true, opts = { methods = { diagnostics = false } } },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local timer = (vim.uv or vim.loop).new_timer()
        if not opts.autocmds then opts.autocmds = {} end
        opts.autocmds.auto_lint = {
          {
            event = { "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" },
            desc = "Automatically lint with nvim-lint",
            callback = function()
              -- only run autocommand when nvim-lint is loaded
              if lint then
                timer:start(100, 0, function()
                  timer:stop()
                  vim.schedule(lint.try_lint)
                end)
              end
            end,
          },
        }
      end,
    },
  },
  opts = {},
  config = function(_, opts)
    local astrocore = require "astrocore"
    lint = require "lint"
    lint.linters_by_ft = opts.linters_by_ft or {}
    for name, linter in pairs(opts.linters or {}) do
      local base = lint.linters[name]
      lint.linters[name] = (type(linter) == "table" and type(base) == "table")
          and vim.tbl_deep_extend("force", base, linter)
        or linter
    end

    local valid_linters = function(ctx, linters)
      if not linters then return {} end
      return vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        return linter
          and vim.fn.executable(linter.cmd) == 1
          and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
      end, linters)
    end

    lint._resolve_linter_by_ft = astrocore.patch_func(lint._resolve_linter_by_ft, function(orig, ...)
      local ctx = { filename = vim.api.nvim_buf_get_name(0) }
      ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")

      local linters = valid_linters(ctx, orig(...))
      if not linters[1] then linters = valid_linters(ctx, lint.linters_by_ft["_"]) end -- fallback
      astrocore.list_insert_unique(linters, valid_linters(ctx, lint.linters_by_ft["*"])) -- global

      return linters
    end)

    lint.try_lint()
  end,
}
