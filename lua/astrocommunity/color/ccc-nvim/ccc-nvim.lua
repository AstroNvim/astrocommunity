return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    init = function() table.insert(astronvim.file_plugins, "ccc.nvim") end,
    keys = { { "<leader>uC", "<cmd>CccPick<cr>", desc = "Toggle colorizer" } },
    opts = { highlighter = { auto_enable = true } },
    config = function(_, opts)
      require("ccc").setup(opts)
      require("ccc:highlighter"):enable()
    end,
  },
}
