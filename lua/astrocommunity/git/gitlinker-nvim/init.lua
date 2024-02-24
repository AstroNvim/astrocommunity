return {
  {
    "linrongbin16/gitlinker.nvim",
    event = "BufRead",
    dependencies = {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local prefix = "<Leader>g"
        opts.mappings.n[prefix .. "y"] = { "<CMD>GitLink<CR>", desc = "Git link copy" }
        opts.mappings.n[prefix .. "z"] = { "<CMD>GitLink!<CR>", desc = "Git link open" }
        opts.mappings.v[prefix .. "y"] = { "<CMD>GitLink<CR>", desc = "Git link copy" }
        opts.mappings.v[prefix .. "z"] = { "<CMD>GitLink!<CR>", desc = "Git link open" }
      end,
    },
    opts = {},
  },
}
