return {
  "dmmulroy/ts-error-translator.nvim",
  lazy = true,
  dependencies = {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      if not opts.lsp_handlers then opts.lsp_handlers = {} end
      local event = "textDocument/publishDiagnostics"
      local orig = opts.lsp_handlers[event] or vim.lsp.handlers[event]
      opts.lsp_handlers[event] = function(err, result, ctx, config)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if
          client
          and vim.tbl_contains({
            "astro",
            "svelte",
            "ts_ls",
            "typescript-tools",
            "volar",
            "vtsls",
          }, client.name)
        then
          vim.tbl_map(require("ts-error-translator").translate, result.diagnostics)
        end
        orig(err, result, ctx, config)
      end
    end,
  },
  opts = function() return { auto_override_publish_diagnostics = not require("astrocore").is_available "astrolsp" } end,
}
