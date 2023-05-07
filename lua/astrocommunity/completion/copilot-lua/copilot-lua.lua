local utils = require "astronvim.utils"
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "User AstroFile",
  opts = function(_, opts)
    opts.suggestion = utils.list_insert_unique(opts.suggestion, { auto_trigger = true, debounce = 150 })
  end,
}
