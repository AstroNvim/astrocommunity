local prefix = "<leader>u"
return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  config = function()
    local transparent = require "transparent"
    transparent.setup {
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
    }
    transparent.clear_prefix "BufferLine"
    transparent.clear_prefix "NeoTree"
    transparent.clear_prefix "lualine"
  end,
  keys = {
    { prefix .. "T", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency" },
  },
}
