local keymaps = {
  ["<Leader>la"] = {
    function() require("actions-preview").code_actions() end,
    desc = "LSP code action",
    cond = "testDocument/codeAction",
  },
}

local mappings = {
  n = keymaps,
  v = keymaps,
}

---@type LazySpec
return {
  "aznhe21/actions-preview.nvim",
  event = "User AstroLspSetup",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    {
      "AstroNvim/astrolsp",
      ---@type AstroLSPOpts
      opts = {
        mappings = mappings,
      },
    },
  },
}
