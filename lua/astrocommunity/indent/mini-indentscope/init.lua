return {
  {
    "echasnovski/mini.indentscope",
    event = "User AstroFile",
    opts = { symbol = "│", options = { try_as_border = true } },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "aerial",
          "alpha",
          "dashboard",
          "fzf",
          "help",
          "neo-tree",
          "lazy",
          "lspinfo",
          "mason",
          "notify",
          "null-ls-info",
          "starter",
          "toggleterm",
          "Trouble",
          "undotree",
        },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { mini = true } },
  },
}
