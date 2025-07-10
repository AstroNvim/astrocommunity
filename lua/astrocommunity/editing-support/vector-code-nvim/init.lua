return {
  "Davidyz/VectorCode",
  build = function()
    if not vim.fn.executable "uv" then
      error "The VectorCode pack requires uv installed"
    end
    vim.cmd("uv tool install vectorcode")
  end,
  version = "*", -- optional, depending on whether you're on nightly or release
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "VectorCode", -- if you're lazy-loading VectorCode
  specs = {
    {
      "olimorris/codecompanion.nvim",
      optional = true,
      opts = {
        extensions = {
          vectorcode = {
            opts = {
              tool_group = {
                -- this will register a tool group called `@vectorcode_toolbox` that contains all 3 tools
                enabled = true,
                -- a list of extra tools that you want to include in `@vectorcode_toolbox`.
                -- if you use @vectorcode_vectorise, it'll be very handy to include
                -- `file_search` here.
                extras = {},
                collapse = false, -- whether the individual tools should be shown in the chat
              },
              tool_opts = {
                ls = {},
                vectorise = {},
                query = {
                  max_num = { chunk = -1, document = -1 },
                  default_num = { chunk = 50, document = 10 },
                  include_stderr = false,
                  use_lsp = false,
                  no_duplicate = true,
                  chunk_mode = false,
                  summarise = {
                    enabled = false,
                    adapter = nil,
                    query_augmented = true,
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
