return {
  {
    "smjonas/inc-rename.nvim",
    event = "User AstroLspSetup",
    dependencies = {
      "AstroNvim/astrolsp",
      ---@type AstroLSPOpts
      opts = {
        ---@diagnostic disable: missing-fields
        mappings = {
          n = {
            ["<Leader>lr"] = {
              ":IncRename ",
              desc = "IncRename",
              cond = "textDocument/rename",
            },
          },
        },
      },
    },
    cmd = "IncRename",
    opts = {},
  },
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = {
        inc_rename = true,
      },
    },
  },
}
