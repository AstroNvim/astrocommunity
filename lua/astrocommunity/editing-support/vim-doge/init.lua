return {
  "kkoomen/vim-doge",
  build = function() vim.cmd "call doge#install()" end,
  cmd = "DogeGenerate",
  lazy = false,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        if not opts.options then opts.options = {} end
        if not opts.options.g then opts.options.g = {} end
        opts.options.g.doge_enable_mappings = 0
        local maps = opts.mappings
        maps.n["<Leader>a"] = {
          "<Plug>(doge-generate)",
          desc = "Générer annotation",
        }
        maps.n["<TAB>"] = {
          "<Plug>(doge-comment-jump-forward)",
        }
        maps.n["<S-TAB>"] = {
          "<Plug>(doge-comment-jump-backward)",
        }
        maps.i["<TAB>"] = {
          "<Plug>(doge-comment-jump-forward)",
        }
        maps.i["<S-TAB>"] = {
          "<Plug>(doge-comment-jump-backward)",
        }
        maps.x["<TAB>"] = {
          "<Plug>(doge-comment-jump-forward)",
        }
        maps.x["<S-TAB>"] = {
          "<Plug>(doge-comment-jump-backward)",
        }
      end,
    },
  },
}
