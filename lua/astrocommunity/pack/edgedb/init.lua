return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { extensions = {
      esdl = "edgeql",
      edgeql = "edgeql",
    } } },
  },
  {
    "edgedb/edgedb-vim",
    ft = "edgeql",
  },
}
