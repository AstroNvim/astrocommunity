local utils = require "astronvim.utils"
return {
  {
    "bennypowers/nvim-regexplainer",
    opts = {},
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  -- Regex support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add regex to treesitters
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "regex")
      end
    end,
  },
}
