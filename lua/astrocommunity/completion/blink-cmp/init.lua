return {
  "Saghen/blink.cmp",
  event = "InsertEnter",
  version = "v0.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    highlight = { use_nvim_cmp_as_default = true },
  },
  specs = {
    -- disable built in completion plugins
    { "hrsh7th/nvim-cmp", enabled = false },
    { "rcarriga/cmp-dap", enabled = false },
    { "L3MON4D3/LuaSnip", enabled = false },
    { "onsails/lspkind.nvim", enabled = false },
  },
}
