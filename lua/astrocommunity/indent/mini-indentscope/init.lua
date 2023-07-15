return {
  "echasnovski/mini.indentscope",
  event = "User AstroFile",
  opts = { symbol = "│", options = { try_as_border = true } },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "fzf",
        "starter",
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "lspinfo",
        "mason",
        "undotree",
      },
      callback = function() vim.b.miniindentscope_disable = true end,
    })
  end,
}
