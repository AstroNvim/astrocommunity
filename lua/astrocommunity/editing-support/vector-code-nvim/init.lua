return {
  "Davidyz/VectorCode",
  build = function()
    if vim.fn.executable "uv" == 1 then
      assert(vim
        .system({
          "uv",
          "tool",
          vim.fn.executable "vectorcode" == 1 and "upgrade" or "install",
          "vectorcode",
        })
        :wait().code == 0, "Failed to install or upgrade vectorcode with uv")
    elseif vim.fn.executable "pipx" == 1 then
      assert(
        vim.system({ "pipx", "install", "--force", "git+https://github.com/Davidyz/VectorCode" }):wait().code == 0,
        "Failed to install vectorcode with pipx"
      )
    else
      error "The VectorCode pack requires `uv` or `pipx` to be installed"
    end
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
