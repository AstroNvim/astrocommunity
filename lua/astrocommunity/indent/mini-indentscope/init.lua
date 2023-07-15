return {
  "echasnovski/mini.indentscope",
  event = "User AstroFile",
  opts = { symbol = "│", options = { try_as_border = true } },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "alpha",
        "aerial",
        "dashboard",
        "fzf",
        "help",
        "neo-tree",
        "Trouble",
        "lazy",
        "lspinfo",
        "mason",
        "starter",
        "undotree",
      },
      callback = function() vim.b.miniindentscope_disable = true end,
    })
  end,
}
