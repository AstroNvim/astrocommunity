---@type LazySpec
return {
  {
    "ray-x/lsp_signature.nvim",
    event = "User AstroFile",
    main = "lsp_signature",
    opts = {
      hint_enable = false, -- disable hints as it will crash in some terminal
    },
  },
  {
    "folke/noice.nvim",
    optional = true,
    ---@type NoiceConfig
    opts = {
      lsp = {
        signature = { enabled = false },
        hover = { enabled = false },
      },
    },
  },
}
