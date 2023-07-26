local utils = require "astrocore"

return {
  "gbprod/cutlass.nvim",
  event = { "User AstroFile" },
  opts = function(_, opts)
    if utils.is_available "leap.nvim" then opts.exclude = utils.list_insert_unique(opts.exclude, { "ns", "nS" }) end
    if utils.is_available "hop.nvim" then opts.exclude = utils.list_insert_unique(opts.exclude, { "ns", "nS" }) end
  end,
}
