return {
  "echasnovski/mini.indentscope",
  event = "User AstroFile",
  opts = { symbol = "│", options = { try_as_border = true } },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fzf", "starter", "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function() vim.b.miniindentscope_disable = true end,
    })
    require("mini.indentscope").setup(opts)
  end,
}
