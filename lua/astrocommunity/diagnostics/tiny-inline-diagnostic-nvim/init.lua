return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  dependencies = {
    "astronvim/astrocore",
    opts = {
      features = {
        -- Disable diagnostics virtual textto prevet duplicates
        diagnostics_mode = 2,
      },
    },
  },
  opts = {},
}
