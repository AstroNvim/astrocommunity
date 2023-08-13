return {
  {
    "echasnovski/mini.indentscope",
    event = "User AstroFile",
    opts = { symbol = "│", options = { try_as_border = true } },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          local excluded_filetypes = {
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
          }
          local excluded_buftypes = {
            "nofile",
            "prompt",
            "quickfix",
            "terminal",
          }
          if
            vim.tbl_contains(excluded_filetypes, vim.bo["filetype"])
            or vim.tbl_contains(excluded_buftypes, vim.bo["buftype"])
          then
            vim.b.miniindentscope_disable = true
          end
        end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { mini = true } },
  },
}
