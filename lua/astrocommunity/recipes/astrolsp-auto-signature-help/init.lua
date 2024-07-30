return {
  "AstroNvim/astrolsp",
  specs = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        autocmds = {
          signature_help_triggers = {
            {
              event = "LspAttach",
              desc = "Add signature help triggers as language servers attach",
              callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.supports_method "textDocument/signatureHelp" then
                  vim.b[args.buf].signature_help_trigger = require("astrocore").list_insert_unique(
                    vim.b[args.buf].signature_help_trigger,
                    client.server_capabilities.signatureHelpProvider.triggerCharacters or {}
                  )
                end
              end,
            },
            {
              event = "LspDetach",
              desc = "Safely remove LSP signature help triggers when language servers detach",
              callback = vim.schedule_wrap(function(args)
                if not vim.api.nvim_buf_is_valid(args.buf) then return end
                local signature_help_trigger = {}
                for _, client in pairs((vim.lsp.get_clients or vim.lsp.get_active_clients) { bufnr = args.buf }) do
                  if client.id ~= args.data.client_id and client.supports_method "textDocument/signatureHelp" then
                    require("astrocore").list_insert_unique(
                      signature_help_trigger,
                      client.server_capabilities.signatureHelpProvider.triggerCharacters or {}
                    )
                  end
                end
                vim.b[args.buf].signature_help_trigger = signature_help_trigger
              end),
            },
          },
        },
      },
    },
  },
  ---@type AstroLSPOpts
  opts = {
    autocmds = {
      auto_signature_help = {
        cond = "textDocument/signatureHelp",
        {
          event = "TextChangedI",
          desc = "Automatically trigger signature help when a trigger character is typed",
          callback = function(args)
            local signature_help_trigger = vim.b[args.buf].signature_help_trigger
            if signature_help_trigger then
              local cur_line = vim.api.nvim_get_current_line():gsub("%s+$", "") -- rm trailing spaces
              local pos = vim.api.nvim_win_get_cursor(0)[2]
              local cur_char = cur_line:sub(pos, pos)

              for _, char in ipairs(signature_help_trigger) do
                if cur_char == char then
                  vim.lsp.buf.signature_help()
                  return
                end
              end
            end
          end,
        },
      },
    },
  },
}
