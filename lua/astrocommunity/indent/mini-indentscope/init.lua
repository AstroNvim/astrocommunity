return {
  {
    "echasnovski/mini.indentscope",
    event = "User AstroFile",
    opts = { symbol = "│", options = { try_as_border = true } },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          if
            vim.tbl_contains(vim.g.indent_blankline_filetype_exclude, vim.bo["filetype"])
            or vim.tbl_contains(vim.g.indent_blankline_buftype_exclude, vim.bo["buftype"])
            or vim.tbl_contains(vim.g.indent_blankline_bufname_exclude, vim.api.nvim_buf_get_name(0))
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
