local cmp = require "cmp"

return {
  "hrsh7th/cmp-cmdline",
  lazy = false,
  opts = {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
    }, {
      { name = "buffer" },
    }),
  },
  config = function(_, opts) require("cmp").setup.cmdline(":", opts) end,
}
