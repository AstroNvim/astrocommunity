return {
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "L3MON4D3/LuaSnip", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  { "rcarriga/cmp-dap", enabled = false },
  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    event = "InsertEnter",
    build = ":COQdeps",
    cmd = { "COQnow", "COQhelp", "COQstats", "COQdeps" },
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
  },
}
