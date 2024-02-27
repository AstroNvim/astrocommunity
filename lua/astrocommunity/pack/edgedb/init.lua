return {
  "edgedb/edgedb-vim",
  ft = "edgeql",
  init = function()
    vim.filetype.add {
      extensions = {
        esdl = "edgeql",
        edgeql = "edgeql",
      },
    }
  end,
}
