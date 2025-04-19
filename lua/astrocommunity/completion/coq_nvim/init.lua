return {
  "ms-jpq/coq_nvim",
  branch = "coq",
  event = "InsertEnter",
  build = ":COQdeps",
  cmd = { "COQnow", "COQhelp", "COQstats", "COQdeps" },
  specs = {
    { "Saghen/blink.cmp", optional = true, enabled = false },
    { "hrsh7th/nvim-cmp", optional = true, enabled = false },
    { "hrsh7th/cmp-buffer", optional = true, enabled = false },
    { "hrsh7th/cmp-nvim-lsp", optional = true, enabled = false },
    { "hrsh7th/cmp-path", optional = true, enabled = false },
    { "L3MON4D3/LuaSnip", optional = true, enabled = false },
    { "saadparwaiz1/cmp_luasnip", optional = true, enabled = false },
    { "rcarriga/cmp-dap", optional = true, enabled = false },
  },
  dependencies = {
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            coq_settings = {
              auto_start = "shut-up",
              keymap = { jump_to_mark = "<Tab>" },
            },
          },
        },
      },
    },
    {
      "AstroNvim/astrolsp",
      optional = true,
      opts = {
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                deprecatedSupport = true,
                insertReplaceSupport = true,
                insertTextModeSupport = { valueSet = { 1, 2 } },
                labelDetailsSupport = true,
                preselectSupport = true,
                resolveSupport = { properties = {} },
                snippetSupport = true,
                tagSupport = { valueSet = { 1 } },
              },
            },
          },
        },
      },
    },
  },
}
