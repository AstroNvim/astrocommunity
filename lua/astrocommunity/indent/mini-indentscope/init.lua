return {
  {
    "echasnovski/mini.indentscope",
    event = "User AstroFile",
    opts = { symbol = "│", options = { try_as_border = true } },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "Trouble",
          "aerial",
          "alpha",
          "checkhealth",
          "dashboard",
          "fzf",
          "help",
          "lazy",
          "lspinfo",
          "man",
          "mason",
          "neo-tree",
          "notify",
          "null-ls-info",
          "starter",
          "toggleterm",
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
