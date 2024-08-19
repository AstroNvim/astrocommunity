---@type LazySpec
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  version = "*",
  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatStop",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatDebugInfo",
    "CopilotChatModels",
    "CopilotChatExplain",
    "CopilotChatReview",
    "CopilotChatFix",
    "CopilotChatOptimize",
    "CopilotChatDocs",
    "CopilotChatFixDiagnostic",
    "CopilotChatCommit",
    "CopilotChatCommitStaged",
  },
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)

        local prefix = "<Leader>P"
        maps.n[prefix] = { desc = require("astroui").get_icon("CopilotChat", 1, true) .. "CopilotChat" }
        maps.v[prefix] = { desc = require("astroui").get_icon("CopilotChat", 1, true) .. "CopilotChat" }

        maps.n[prefix .. "t"] = { ":CopilotChatToggle<CR>", desc = "Toggle Chat" }
        maps.n[prefix .. "r"] = { ":CopilotChatReset<CR>", desc = "Reset Chat" }
        maps.n[prefix .. "s"] = { ":CopilotChatStop<CR>", desc = "Stop Chat" }

        -- Look into saving chats
        -- See if there is anythig else we can use from this
        -- cmp?
        -- https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat-v2.lua

        maps.n[prefix .. "p"] = {
          function()
            require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").prompt_actions {
              selection = require("CopilotChat.select").buffer,
            })
          end,
          desc = "Prompt actions",
        }

        maps.v[prefix .. "p"] = {
          function()
            require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").prompt_actions {
              selection = require("CopilotChat.select").visual,
            })
          end,
          desc = "Prompt actions",
        }

        maps.n[prefix .. "h"] = {
          function()
            require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").help_actions {
              selection = require("CopilotChat.select").buffer,
            })
          end,
          desc = "Help actions",
        }
        maps.v[prefix .. "h"] = {
          function()
            require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions").help_actions {
              selection = require("CopilotChat.select").visual,
            })
          end,
          desc = "Help actions",
        }

        maps.n[prefix .. "q"] = {
          function()
            vim.ui.input({ prompt = "Quick Chat: " }, function(input)
              if input ~= nil and input ~= "" then
                require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
              end
            end)
          end,
          desc = "Quick Chat",
        }

        maps.v[prefix .. "q"] = {
          function()
            vim.ui.input({ prompt = "Quick Chat: " }, function(input)
              if input ~= nil and input ~= "" then
                require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
              end
            end)
          end,
          desc = "Quick Chat",
        }
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { CopilotChat = "" } } },
  },
  opts = {},
}
