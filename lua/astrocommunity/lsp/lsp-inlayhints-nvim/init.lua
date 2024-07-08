return {
  "lvimuser/lsp-inlayhints.nvim",
  lazy = true,
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        LspAttach_inlayhints = {
          {
            event = "LspAttach",
            callback = function(args)
              if not (args.data and args.data.client_id) then return end
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and client.server_capabilities.inlayHintProvider then
                local inlayhints = require "lsp-inlayhints"
                inlayhints.on_attach(client, args.buf)
                require("astrocore").set_mappings({
                  n = {
                    ["<Leader>uh"] = { inlayhints.toggle, desc = "Toggle inlay hints" },
                  },
                }, { buffer = args.buf })
              end
            end,
          },
        },
      },
    },
  },
  specs = {
    {
      "p00f/clangd_extensions.nvim",
      optional = true,
      opts = { extensions = { autoSetHints = false } },
    },
    {
      "simrat39/rust-tools.nvim",
      optional = true,
      opts = { tools = { inlay_hints = { auto = false } } },
    },
  },
  init = function()
    require("astrocore").notify("`lsp-inlayhints.nvim` has been archived and is now read only!", vim.log.levels.WARN)
  end,
  opts = {},
}
