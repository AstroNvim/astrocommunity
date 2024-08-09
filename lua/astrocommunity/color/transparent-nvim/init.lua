return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  opts = {
    extra_groups = {
      "NormalFloat",
      "NvimTreeNormal",
    },
  },
  config = function(_, opts)
    local transparent = require "transparent"
    transparent.setup(opts)
    transparent.clear_prefix "BufferLine"
    transparent.clear_prefix "NeoTree"
    transparent.clear_prefix "lualine"
  end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uT"] = { "<Cmd>TransparentToggle<CR>", desc = "Toggle transparency" },
          },
        },
      },
    },
  },
}
