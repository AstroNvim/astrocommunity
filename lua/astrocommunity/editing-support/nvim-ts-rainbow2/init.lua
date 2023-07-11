return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    init = function()
      require("astronvim.utils").notify(
        "`nvim-ts-rainbow2` is deprecated!\nPlease use `rainbow-delimiters`",
        vim.log.levels.WARN
      )
    end,
  },
  opts = { rainbow = { enable = true } },
}
