return {
  { "neo-tree.nvim", enabled = false },
  {
    "echasnovski/mini.files",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>e"] = {
                function()
                  if not require("mini.files").close() then require("mini.files").open() end
                end,
                desc = "Explorer",
              },
            },
          },
        },
      },
    },
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
