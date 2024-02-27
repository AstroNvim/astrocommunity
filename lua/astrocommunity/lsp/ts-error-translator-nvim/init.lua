return {
  -- TODO: move back to upstream after PR: https://github.com/dmmulroy/ts-error-translator.nvim/pull/18
  -- "dmmulroy/ts-error-translator.nvim",
  "mehalter/ts-error-translator.nvim",
  branch = "reuse_existing_handler",
  lazy = true,
  dependencies = {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      if not opts.lsp_handlers then opts.lsp_handlers = {} end
      local event = "textDocument/publishDiagnostics"
      local orig = opts.lsp_handlers[event] or vim.lsp.handlers[event]
      opts.lsp_handlers[event] = function(err, result, ctx, config)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if client and vim.tbl_contains({ "tsserver", "vtsls" }, client.name) then
          require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
        end
        orig(err, result, ctx, config)
      end
    end,
  },
  opts = { auto_override_publish_diagnostics = false },
}
