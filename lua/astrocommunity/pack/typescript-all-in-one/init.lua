return {
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.typescript-deno" },
  {
    "sigmasd/deno-nvim",
    -- HACK: This disables tsserver if denols is attached.
    -- A solution that only enables the required lsp should replace it.
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local curr_client = vim.lsp.get_client_by_id(args.data.client_id)

          if curr_client and curr_client.name == "denols" then
            local clients = vim.lsp.get_clients { bufnr = bufnr }
            for _, client in ipairs(clients) do
              if client.name == "tsserver" or client.name == "typescript-tools" then
                vim.lsp.stop_client(client.id, true)
              end
            end
          end

          -- if tsserver attached, stop it if there is a denols server attached
          if curr_client and curr_client.name == "tsserver" then
            local clients = vim.lsp.get_clients { bufnr = bufnr }
            for _, client in ipairs(clients) do
              if client.name == "denols" then
                vim.lsp.stop_client(curr_client.id, true)
                break
              end
            end
          end

          -- if typescript-tools attached, stop it if there is a denols server attached
          if curr_client and curr_client.name == "typescript-tools" then
            local clients = vim.lsp.get_clients { bufnr = bufnr }
            for _, client in ipairs(clients) do
              if client.name == "denols" then
                vim.lsp.stop_client(curr_client.id, true)
                break
              end
            end
          end
        end,
      })
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      opts.server = astrolsp_avail and astrolsp.lsp_opts "denols"
      opts.server.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
    end,
  },
}
