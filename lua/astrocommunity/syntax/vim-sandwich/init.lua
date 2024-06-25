return {
  {
    "machakann/vim-sandwich",
    dependencies = {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        opts.options.g.sandwich_no_default_key_mappings = true

        local maps = assert(opts.mappings)
        maps.n.sa = { "<Plug>(sandwich-add)", desc = "Add surrounding" }
        maps.o.sa = maps.n.sa
        maps.x.sa = maps.n.sa
        maps.n.sd = { "<Plug>(sandwich-delete)", desc = "Delete surrounding" }
        maps.n.sr = { "<Plug>(sandwich-replace)", desc = "Replace surrounding" }
      end,
    },
    keys = {
      { "<Plug>(sandwich-add)", mode = { "n", "x", "o" } },
      "<Plug>(sandwich-delete)",
      "<Plug>(sandwich-replace)",
    },
  },
  {
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { sandwich = true } },
  },
}
