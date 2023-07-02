return {
  "jackMort/ChatGPT.nvim",
  init = function() table.insert(astronvim.file_plugins, "ChatGPT.nvim") end,
  enabled = true,
  event = "VeryLazy",
  depencencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
