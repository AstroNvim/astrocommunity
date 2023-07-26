return {
  {
    "AstroNvim/astrocore",
    mappings = {
      n = {
        { "sa", "Add surrounding" },
        { "sd", "Delete surrounding" },
        { "sr", "Replace surrounding" },
      },
      v = {
        { "sa", "Add surrounding" },
      },
    },
  },
  {
    "machakann/vim-sandwich",
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { sandwich = true } },
  },
}
