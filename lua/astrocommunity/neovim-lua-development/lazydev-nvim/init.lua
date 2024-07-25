return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  opts = function(_, opts)
    if not opts.library then
      opts.library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "astrocore", words = { "AstroCore" } },
        { path = "astrolsp", words = { "AstroLSP" } },
        { path = "astroui", words = { "AstroUI" } },
        { path = "astrotheme", words = { "AstroTheme" } },
        { path = "lazy.nvim", words = { "Lazy" } },
      }
    end
  end,
  specs = {
    { "folke/neodev.nvim", optional = true, enabled = false },
    { "Bilal2453/luvit-meta", lazy = true },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      opts = function(_, opts)
        local lazydev_inserted
        for _, source in ipairs(opts.sources or {}) do
          if (type(source) == "table" and source.name or source) == "lazydev" then
            lazydev_inserted = true
            break
          end
        end
        if not lazydev_inserted then table.insert(opts.sources, { name = "lazydev", group_index = 0 }) end
      end,
    },
  },
}
