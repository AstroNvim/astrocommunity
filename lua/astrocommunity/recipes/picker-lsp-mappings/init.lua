return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    if require("astrocore").is_available "snacks.nvim" then
      opts.mappings.n.grr = {
        function() require("snacks.picker").lsp_references() end,
        desc = "LSP References",
        cond = "textDocument/references",
      }
      opts.mappings.n.gri = {
        function() require("snacks.picker").lsp_implementations() end,
        desc = "LSP Implementations",
        cond = "textDocument/implementation",
      }
      opts.mappings.n.gO = {
        function() require("snacks.picker").lsp_symbols() end,
        desc = "LSP Document Symbols",
      }

      if opts.mappings.n.gd then opts.mappings.n.gd[1] = function() require("snacks.picker").lsp_definitions() end end
      if opts.mappings.n.gI then
        opts.mappings.n.gI[1] = function() require("snacks.picker").lsp_implementations() end
      end
      if opts.mappings.n.gy then
        opts.mappings.n.gy[1] = function() require("snacks.picker").lsp_type_definitions() end
      end
      if opts.mappings.n["<Leader>lG"] then
        opts.mappings.n["<Leader>lG"][1] = function() require("snacks.picker").lsp_workspace_symbols() end
      end
      if opts.mappings.n["<Leader>lR"] then
        opts.mappings.n["<Leader>lR"][1] = function() require("snacks.picker").lsp_references() end
      end
    elseif require("astrocore").is_available "telescope.nvim" then
      if opts.mappings.n.gd then
        opts.mappings.n.gd[1] = function() require("telescope.builtin").lsp_definitions { reuse_win = true } end
      end
      if opts.mappings.n.gI then
        opts.mappings.n.gI[1] = function() require("telescope.builtin").lsp_implementations { reuse_win = true } end
      end
      if opts.mappings.n.gy then
        opts.mappings.n.gy[1] = function() require("telescope.builtin").lsp_type_definitions { reuse_win = true } end
      end
      if opts.mappings.n["<Leader>lG"] then
        opts.mappings.n["<Leader>lG"][1] = function()
          vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
            if query then
              -- word under cursor if given query is empty
              if query == "" then query = vim.fn.expand "<cword>" end
              require("telescope.builtin").lsp_workspace_symbols {
                query = query,
                prompt_title = ("Find word (%s)"):format(query),
              }
            end
          end)
        end
      end
      if opts.mappings.n["<Leader>lR"] then
        opts.mappings.n["<Leader>lR"][1] = function() require("telescope.builtin").lsp_references() end
      end
    end
  end,
}
