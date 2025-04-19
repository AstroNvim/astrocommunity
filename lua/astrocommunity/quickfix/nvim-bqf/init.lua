return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  dependencies = {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if not opts.signs then opts.signs = {} end
      opts.signs.BqfSign = { text = " " .. require("astroui").get_icon "Selected", texthl = "BqfSign" }
    end,
  },
  opts = {},
}
