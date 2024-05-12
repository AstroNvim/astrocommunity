---@type LazySpec
return {
  {
    "Julian/lean.nvim",
    ft = { "lean" },
    opts = {
      lsp = {
        on_attach = function(...)
          local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
          if astrolsp_avail then astrolsp.on_attach(...) end
        end,
      },
      mappings = true,
    },
  },
}
