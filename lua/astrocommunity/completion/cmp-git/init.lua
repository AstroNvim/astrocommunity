return {
  "petertriho/cmp-git",
  ft = { "gitcommit", "octo", "NeogitCommitMessage" },
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = function(_, opts)
    opts.filetypes = require("lazy.core.plugin").values(assert(require("astrocore").get_plugin "cmp-git"), "ft")
  end,
  config = function(_, opts)
    if opts.filetypes then
      local cmp = require "cmp"
      cmp.setup.filetype(opts.filetypes, {
        sources = cmp.config.sources({
          { name = "git" },
        }, {
          { name = "buffer" },
        }),
      })
    end
    require("cmp_git").setup(opts)
  end,
}
