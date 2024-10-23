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
      specs = {
        {
          "AstroNvim/astrocore",
          opts = {
            options = {
              g = {
                db_use_nerd_fonts = vim.g.icons_enabled and 1 or nil,
              },
            },
          },
        },
      },
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
                    pattern = { "sql", "mysql", "plsql" },
                    callback = function()
                      require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
                    end,
                  },
                },
              },
            },
          },
        },
      },
    },
  },
}
