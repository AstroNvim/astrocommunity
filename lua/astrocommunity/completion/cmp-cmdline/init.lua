return {
  "hrsh7th/cmp-cmdline",
  opts = function()
    local cmp_mapping = require "cmp.config.mapping"
    local cmp_sources = require "cmp.config.sources"

    return {
      mapping = cmp_mapping.preset.cmdline(),
      sources = cmp_sources({
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
    }
  end,
  config = function(_, opts) require("cmp").setup.cmdline(":", opts) end,
  dependencies = {
    "nvim-cmp",
  },
  event = { "CmdlineEnter" },
}
