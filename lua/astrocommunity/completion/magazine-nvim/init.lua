return {
  "iguanacucumber/magazine.nvim",
  lazy = true,
  config = function() vim.opt.rtp:remove(require("astrocore").get_plugin("nvim-cmp").dir) end,
  specs = {
    { import = "astrocommunity.completion.nvim-cmp" },
    { "hrsh7th/nvim-cmp", dependencies = { "iguanacucumber/magazine.nvim" } },
    { "Saghen/blink.cmp", enabled = false },
    { "Saghen/blink.compat", enabled = false },
  },
}
