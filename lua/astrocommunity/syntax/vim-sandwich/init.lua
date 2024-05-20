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
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { sandwich = true } },
  },
}
