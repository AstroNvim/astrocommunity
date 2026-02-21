return {
  "dmtrKovalenko/fff.nvim",
  build = function() require("fff.download").download_or_build_binary() end,
  lazy = false,
  opts = {},
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>ff"] = { function() require("fff").find_files() end, desc = "Find files" },
          },
        },
      },
    },
  },
}
