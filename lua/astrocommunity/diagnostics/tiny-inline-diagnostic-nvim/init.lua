return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  dependencies = {
    "astronvim/astrocore",
    opts = {
      diagnostics = {
        -- Disable diagnostics virtual text to prevent duplicates
        virtual_text = false,
      },
    },
  },
  opts = {},
}
