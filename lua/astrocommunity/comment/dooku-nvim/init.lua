return {
  {
    "Zeioth/dooku.nvim",
    cmd = { "DookuGenerate", "DookuOpen", "DookuAutoSetup" },
    opts = {
      -- your config options here
    },
    config = function(_, opts) require("dooku").setup(opts) end,
  }
}
