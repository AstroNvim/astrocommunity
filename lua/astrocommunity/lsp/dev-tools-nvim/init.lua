return {
  "yarospace/dev-tools.nvim",
  lazy = true,
  event = "BufEnter",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
    {
      "folke/snacks.nvim",
      opts = {
        picker = { enabled = true },
        terminal = { enabled = true },
      },
    },
    {
      "ThePrimeagen/refactoring.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
    ---@type Action[]|fun():Action[]
    actions = {},

    filetypes = { -- filetypes for which to attach the LSP
      include = {}, -- {} to include all
      exclude = {},
    },
  },
}
