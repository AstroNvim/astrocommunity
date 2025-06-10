return {
  "fiqryq/wakastat.nvim",
  config = function()
    require("wakastat").setup {
      args = { "--today" },
      format = "Today Coding Time: %s",
      update_interval = 300,
    }
  end,
  dependencies = { "rebelot/heirline.nvim" },
}
