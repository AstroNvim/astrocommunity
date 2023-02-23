return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  init = function() table.insert(astronvim.file_plugins, "refactoring.nvim") end,
  opts = {},
}
