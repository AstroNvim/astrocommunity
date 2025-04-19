return {
  "gbprod/cutlass.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local utils = require "astrocore"
    if utils.is_available "leap.nvim" or utils.is_available "hop.nvim" then
      opts.exclude = utils.list_insert_unique(opts.exclude, { "ns", "nS" })
    end
  end,
}
