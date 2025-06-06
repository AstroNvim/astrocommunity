return {
  "famiu/feline.nvim",
  event = "VeryLazy",
  opts = {},
  specs = {
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts) opts.statusline = nil end,
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = function()
        local ctp_feline = require "catppuccin.groups.integrations.feline"
        ctp_feline.setup()

        require("feline").setup {
          components = ctp_feline.get(),
        }
      end,
    },
  },
}
