---@type LazySpec
return {
  "amarakon/nvim-cmp-buffer-lines",
  lazy = true,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = { "amarakon/nvim-cmp-buffer-lines" },
      opts = function(_, opts)
        local cmp = require "cmp"
        return require("astrocore").extend_tbl(opts, {
          mapping = {
            ["<C-x><C-l>"] = cmp.mapping.complete { -- this could've been a more ergonomic hotkey, but it would be a reach to try to make up one, that would fit everyone.
              config = {
                sources = {
                  {
                    name = "buffer-lines",
                    priority = 50,
                    option = {
                      leading_whitespace = false,
                    },
                  },
                },
              },
            },
          },
        })
      end,
    },
  },
}
