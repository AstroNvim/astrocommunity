return {
  {
    "machakann/vim-sandwich",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
      {
        "AstroNvim/astrocore",
        mappings = {
          n = {
            { "sa", desc = "Add surrounding" },
            { "sd", desc = "Delete surrounding" },
            { "sr", desc = "Replace surrounding" },
          },
          v = {
            { "sa", desc = "Add surrounding" },
          },
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { sandwich = true } },
  },
}
