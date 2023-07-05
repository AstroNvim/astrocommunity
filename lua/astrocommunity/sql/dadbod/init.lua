return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = "tpope/vim-dadbod",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = {
      {
        "kristijanhusak/vim-dadbod-completion",
        config = function()
          vim.api.nvim_create_autocmd("FileType", {
            desc = "dadbod completion",
            group = vim.api.nvim_create_augroup("dadbod_cmp", { clear = true }),
            pattern = { "sql", "mysql", "plsql" },
            callback = function() require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } } end,
          })
        end,
      },
    },
  },
}
