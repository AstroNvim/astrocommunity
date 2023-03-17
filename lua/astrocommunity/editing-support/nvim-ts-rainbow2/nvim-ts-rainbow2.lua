return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "HiPhish/nvim-ts-rainbow2" },
  opts = { rainbow = { enable = true } },
  config = function(_, opts)
    -- HACK: https://github.com/p00f/nvim-ts-rainbow/issues/112#issuecomment-1310835936
    vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
      callback = function()
        vim.cmd "TSDisable rainbow"
        vim.cmd "TSEnable rainbow"
      end,
    })
    require("nvim-treesitter.configs").setup(opts)
  end,
}
