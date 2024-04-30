---@type LazySpec
return {
  "aznhe21/actions-preview.nvim",
  lazy = true,
  dependencies = {
    "nvim-telescope/telescope.nvim",
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
}
