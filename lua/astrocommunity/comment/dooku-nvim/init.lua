return {
  {
    "Zeioth/dooku.nvim",
    cmd = { "DookuGenerate", "DookuOpen", "DookuAutoSetup" },
    config = function(_, opts) require("dooku").setup(opts) end,
  }
}
