return {
  "shaunsingh/nord.nvim",
  init = function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false
  end,
  config = function() require("nord").set() end,
}
