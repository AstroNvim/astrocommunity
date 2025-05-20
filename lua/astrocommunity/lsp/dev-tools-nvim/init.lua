return {
  "yarospace/dev-tools.nvim",
  lazy = true,
  event = "User AstroFile",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
    {
      "folke/snacks.nvim",
      optional = true,
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
    actions = {},
    filetypes = { -- filetypes for which to attach the LSP
      include = {}, -- {} to include all
      exclude = {},
    },
  },
}
