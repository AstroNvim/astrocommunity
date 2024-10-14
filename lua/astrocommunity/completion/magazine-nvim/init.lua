return {
  "iguanacucumber/magazine.nvim",
  lazy = true,
  config = function() vim.opt.rtp:remove(require("astrocore").get_plugin("nvim-cmp").dir) end,
  specs = { "hrsh7th/nvim-cmp", dependencies = { "iguanacucumber/magazine.nvim" } },
}
