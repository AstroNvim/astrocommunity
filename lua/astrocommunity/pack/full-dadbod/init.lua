return {
  "tpope/vim-dadbod",
  specs = {
    {
      "kristijanhusak/vim-dadbod-ui",
      dependencies = { "tpope/vim-dadbod" },
      cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
      },
      init = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.completion_matching_ignore_case = 1
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = {
        {
          "kristijanhusak/vim-dadbod-completion",
          dependencies = {
            "AstroNvim/astrocore",
            opts = {
              autocmds = {
                dadbod_cmp = {
                  {
                    event = "FileType",
                    desc = "dadbod completion",
                    pattern = { "sql", "mysql", "plsql", "pg" },
                    callback = function()
                      require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
                    end,
                  },
                },
                pg_file = {
                  event = { "BufRead", "BufNewFile" },
                  pattern = "*.pg",
                  command = "set filetype=sql",
                },
              },
            },
          },
        },
      },
    },
  },
}
