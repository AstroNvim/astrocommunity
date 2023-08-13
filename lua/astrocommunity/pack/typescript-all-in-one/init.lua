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
          -- if deno attached, stop all typescript servers
          if curr_client.name == "denols" then
            vim.lsp.for_each_buffer_client(bufnr, function(client, client_id)
              if client.name == "tsserver" then vim.lsp.stop_client(client_id, true) end
            end)
            -- if tsserver attached, stop it if there is a denols server attached
          elseif curr_client.name == "tsserver" then
            for _, client in ipairs(vim.lsp.get_active_clients { bufnr = bufnr }) do
              if client.name == "denols" then
                vim.lsp.stop_client(curr_client.id, true)
                break
              end
            end
          end
        end,
      })
      opts.server = require("astrolsp").lsp_opts "denols"
      opts.server.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
    end,
  },
}
