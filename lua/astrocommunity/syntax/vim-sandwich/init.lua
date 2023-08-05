return {
  {
    "machakann/vim-sandwich",
    keys = {
      { "sa", desc = "Add surrounding", mode = { "n", "v" } },
      { "sd", desc = "Delete surrounding" },
      { "sr", desc = "Replace surrounding" },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { sandwich = true } },
  },
}
