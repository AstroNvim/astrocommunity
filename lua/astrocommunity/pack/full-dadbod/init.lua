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
      "kristijanhusak/vim-dadbod-completion",
      lazy = true,
      specs = {
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
            {
              "saghen/blink.cmp",
              opts = {
                sources = {
                  per_filetype = {
                    sql = { "snippets", "dadbod", "buffer" },
                  },
                  -- add vim-dadbod-completion to your completion providers
                  providers = {
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
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
