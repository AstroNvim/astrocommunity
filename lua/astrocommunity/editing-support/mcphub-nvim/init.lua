return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  },
  event = "User AstroFile",
  cmd = "MCPHub",
  opts = {},
  specs = {
    {
      "olimorris/codecompanion.nvim",
      optional = true,
      opts = {
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true,
              make_vars = true,
              make_slash_commands = true,
            },
          },
        },
      },
    },
    {
      "yetone/avante.nvim",
      optional = true,
      opts = {
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub and hub:get_active_servers_prompt() or ""
        end,
        -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    optional = true,
    opts = {
      extensions = {
        copilotchat = {
          enabled = true,
          convert_tools_to_functions = true,
          convert_resources_to_functions = true,
          add_mcp_prefix = false,
        },
      },
    },
  },
}
