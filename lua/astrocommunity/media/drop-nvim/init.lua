return {
  -- silly drops
  "folke/drop.nvim",
  event = "VeryLazy",
  config = function()
    math.randomseed(os.time())
    local theme = ({ "stars", "snow" })[math.random(1, 3)]
    require("drop").setup { theme = theme }
  end,
}
