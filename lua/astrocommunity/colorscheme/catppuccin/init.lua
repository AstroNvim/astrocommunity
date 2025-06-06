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
}
