return {
  "bassamsdata/namu.nvim",
  cmd = "Namu",
  event = "User AstroFile",
  opts = {},
  specs = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>ls"] = { function() vim.cmd.Namu "symbols" end, desc = "Search symbols" },
        },
      },
    },
  },
}
