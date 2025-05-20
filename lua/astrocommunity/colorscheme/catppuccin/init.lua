return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  ---@type CatppuccinOptions
  opts = {
    integrations = {
      aerial = true,
      blink_cmp = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      mason = true,
      neotree = true,
      symbols_outline = true,
      which_key = true,
      snacks = {
        enabled = true,
        indent_scope_color = "lavender",
      },
    },
  },
  specs = {
    -- {
    --   "akinsho/bufferline.nvim",
    --   optional = true,
    --   opts = function(_, opts)
    --     return require("astrocore").extend_tbl(opts, {
    --       highlights = require("catppuccin.groups.integrations.bufferline").get(),
    --     })
    --   end,
    -- },
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      opts = {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      },
    },
  },
}
