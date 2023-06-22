return {
  "edgedb/edgedb-vim",
  ft = "edgeql",
  config = function()
    vim.api.nvim_create_autocmd(
      { "BufRead", "BufNewFile" },
      { pattern = { "*.esdl", "*.edgeql" }, command = "setf edgeql" }
    )
  end,
}
