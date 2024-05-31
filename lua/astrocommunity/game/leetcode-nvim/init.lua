---@type LazySpec
return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" }, -- required by telescope
    { "MunifTanjim/nui.nvim" },

    -- optional
    { "nvim-treesitter/nvim-treesitter", optional = true },
    { "rcarriga/nvim-notify", optional = true },
    { "nvim-tree/nvim-web-devicons", optional = true },
  },
  opts = {},
}
