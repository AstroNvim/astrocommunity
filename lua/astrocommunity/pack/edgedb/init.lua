return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { extension = {
      esdl = "edgeql",
      edgeql = "edgeql",
    } } },
  },
  {
    "edgedb/edgedb-vim",
    ft = "edgeql",
  },
}
