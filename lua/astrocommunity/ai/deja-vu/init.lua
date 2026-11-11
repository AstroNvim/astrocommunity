return {
  "vshulcz/deja-vu",
  cmd = {
    "DejaRecall",
    "DejaLast",
    "DejaBlame",
    "DejaShow",
    "DejaHandoff",
    "DejaFix",
  },
  opts = {},
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>D"] = { desc = "Deja Session Memory" },
            ["<Leader>Dr"] = { "<Cmd>DejaRecall<CR>", desc = "Recall sessions" },
            ["<Leader>Dl"] = { "<Cmd>DejaLast<CR>", desc = "Recent sessions" },
            ["<Leader>Db"] = { "<Cmd>DejaBlame<CR>", desc = "Blame line across AI sessions" },
            ["<Leader>Dh"] = { "<Cmd>DejaHandoff<CR>", desc = "Copy handoff digest" },
            ["<Leader>Df"] = { "<Cmd>DejaFix<CR>", desc = "Recall fix for diagnostic" },
          },
          v = {
            ["<Leader>D"] = { desc = "Deja Session Memory" },
            ["<Leader>Dr"] = { ":DejaRecall<CR>", desc = "Recall selection" },
          },
        },
      },
    },
  },
}
