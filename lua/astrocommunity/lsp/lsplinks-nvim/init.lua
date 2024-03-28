return {
  "icholy/lsplinks.nvim",
  lazy = true,
  dependencies = {
    { -- lazy load when client is attached with `documentLink` support
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        autocmds = {
          lsplinks_lazy_load = {
            {
              event = "LspAttach",
              desc = "Lazy load `lsplinks.nvim`",
              callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.supports_method and client.supports_method "textDocument/documentLink" then
                  require("lazy").load { plugins = { "lsplinks.nvim" } }
                  return true
                end
              end,
            },
          },
        },
      },
    },
    { -- add buffer local mapping to buffers with documnetLink supporting clients
      "AstroNvim/astrolsp",
      optional = true,
      ---@type AstroLSPOpts
      opts = {
        mappings = {
          n = {
            gx = { function() require("lsplinks").gx() end, cond = "textDocument/documentLink" },
          },
        },
      },
    },
  },
  config = true,
}
