---@type LazySpec
return {
  "aznhe21/actions-preview.nvim",
  lazy = true,
  dependencies = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@type AstroLSPOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>la"] = {
              function() require("actions-preview").code_actions() end,
              desc = "LSP code action",
              cond = "testDocument/codeAction",
            },
          },
          v = {
            ["<Leader>la"] = {
              function() require("actions-preview").code_actions() end,
              desc = "LSP code action",
              cond = "testDocument/codeAction",
            },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local is_available = require("astrocore").is_available
    opts.backend = {
      (is_available "snacks.nvim" and "snacks")
        or (is_available "telescope.nvim" and "telescope")
        or (is_available "mini.pick" and "minipick")
        or (is_available "nui.nvim" and "nui"),
    }
  end,
}
