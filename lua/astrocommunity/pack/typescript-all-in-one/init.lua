return {
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.typescript-deno" },
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      config = {
        denols = {
          -- adjust deno ls root directory detection
          root_dir = function(...) return require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(...) end,
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        -- set up autocommand to choose the correct language server
        typescript_deno_switch = {
          {
            event = "LspAttach",
            callback = function(args)
              local bufnr = args.buf
              local curr_client = vim.lsp.get_client_by_id(args.data.client_id)

              if curr_client and curr_client.name == "denols" then
                local clients = (vim.lsp.get_clients or vim.lsp.get_active_clients) {
                  bufnr = bufnr,
                  name = "vtsls",
                }
                for _, client in ipairs(clients) do
                  vim.lsp.stop_client(client.id, true)
                end
              end

              -- if vtsls attached, stop it if there is a denols server attached
              if curr_client and curr_client.name == "vtsls" then
                if next((vim.lsp.get_clients or vim.lsp.get_active_clients) { bufnr = bufnr, name = "denols" }) then
                  vim.lsp.stop_client(curr_client.id, true)
                end
              end
            end,
          },
        },
      },
    },
  },
}
