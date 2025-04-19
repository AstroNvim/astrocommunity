return {
  "kkoomen/vim-doge",
  build = function() vim.cmd "call doge#install()" end,
  lazy = false,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        if not opts.options then opts.options = {} end
        if not opts.options.g then opts.options.g = {} end
        opts.options.g.doge_enable_mappings = 0
        local maps = opts.mappings
        maps.n["<Leader>a"] = { "<Plug>(doge-generate)", desc = "Generate annotation" }
        for _, mode in ipairs { "n", "i", "s" } do
          maps[mode]["]D"] = { "<Plug>(doge-comment-jump-forward)" }
          maps[mode]["[D"] = { "<Plug>(doge-comment-jump-backward)" }
        end
      end,
    },
  },
}
