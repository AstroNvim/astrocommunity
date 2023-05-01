local utils = require "astronvim.utils"

return {
  "gbprod/cutlass.nvim",
  event = { "User AstroFile" },
  opts = function(_, opts)
    if utils.is_available "leap.nvim" then
      if not opts.exclude then opts.exclude = {} end
      utils.list_insert_unique(opts.exclude, { "ns", "nS" })
    end
  end,
}
