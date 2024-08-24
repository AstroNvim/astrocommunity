return {
  {
    "mgierada/lazydocker.nvim",
    dependencies = {
      "akinsho/toggleterm.nvim",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>t" .. "d"] = {
                function() require("lazydocker").open() end,
                desc = "ToggleTerm LazyDocker",
              },
            },
          },
        },
      },
    },
    opts = {},
  },
}
