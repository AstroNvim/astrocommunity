local has_biome = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local rooter = require "astrocore.rooter"

  local biomejson_rooter = rooter.resolve {
    "biome.json",
  }

  return next(biomejson_rooter(bufnr))
end

return {
  { import = "astrocommunity.pack.typescript.core" },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "biome" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      if not opts.handlers then opts.handlers = {} end

      if ~has_biome() then return end

      -- TODO: prettier should be off for all filetypes that biome supports,
      -- currently this is { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" }
      opts.handlers.prettierd = function() end
    end,
  },
}
