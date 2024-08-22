local prefix = "<Leader>t"
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
              [prefix .. "d"] = {
                function() require("lazydocker").open() end,
                desc = "ToggleTerm LazyDocker",
              },
            },
          },
        },
      },
    },
    config = function() require("lazydocker").setup {} end,
  },
}
