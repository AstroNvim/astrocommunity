return {
  "antosha417/nvim-lsp-file-operations",
  -- lazy will handle loading nvim-tree and neo-tree appropriately based on the module load and our `init` function
  lazy = true,
  -- lazily load plugin after a tree plugin is loaded
  init = function(plugin) require("astrocore").on_load({ "neo-tree.nvim", "nvim-tree.lua" }, plugin.name) end,
  dependencies = {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      local operations = vim.tbl_get(require("astrocore").plugin_opts "nvim-lsp-file-operations", "operations") or {}
      local fileOperations = {}
      for _, operation in ipairs { "willRename", "didRename", "willCreate", "didCreate", "willDelete", "didDelete" } do
        local enabled = vim.tbl_get(operations, operation .. "Files")
        if enabled == nil then enabled = true end
        fileOperations[operation] = enabled
      end
      opts.capabilities =
        vim.tbl_deep_extend("force", opts.capabilities or {}, { workspace = { fileOperations = fileOperations } })
    end,
  },
  main = "lsp-file-operations", -- set the main module name where the `setup` function is
  opts = {},
}
