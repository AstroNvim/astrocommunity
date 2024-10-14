return {
  "Saghen/blink.cmp",
  event = "InsertEnter",
  version = "v0.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = {
      show = { "<C-Space>", "<C-N>", "<C-P>" },
      accept = { "<Tab>", "<CR>" },
      select_prev = { "<Up>", "<C-P>", "<C-K>" },
      select_next = { "<Down>", "<C-N>", "<C-J>" },
      scroll_documentation_up = "<C-D>",
      scroll_documentation_down = "<C-U>",
    },
    windows = {
      autocomplete = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        auto_show = true,
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
      signature_help = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
  specs = {
    -- disable built in completion plugins
    { "hrsh7th/nvim-cmp", enabled = false },
    { "rcarriga/cmp-dap", enabled = false },
    { "L3MON4D3/LuaSnip", enabled = false },
    { "onsails/lspkind.nvim", enabled = false },
  },
}
