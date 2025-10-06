-- TODO: Need to see if the tab causes issues with swapping modes with opencode
---@type LazySpec
return {
  "folke/sidekick.nvim",
  lazy = false,
  specs = {
    -- TODO: Currently, I'm manually starting the copilot lsp with LspStart and then LspCopilotSignIn
    -- If you use copilot.lua this is handled for you.
    {
      "williamboman/mason-lspconfig.nvim",
      optional = true,
      opts = function(_, opts)
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "copilot-language-server" })
      end,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      optional = true,
      opts = function(_, opts)
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "copilot-language-server" })
      end,
    },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>A"
        local cli_tool = vim.g.sidekick_cli_tool or "opencode"
        maps.n[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }
        maps.x[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }

        maps.n[prefix .. "a"] = {
          function() require("sidekick.cli").toggle { name = cli_tool } end,
          desc = "Sidekick Toggle CLI",
        }
        maps.n[prefix .. "s"] = {
          function() require("sidekick.cli").select { name = cli_tool } end,
          -- Or to select only installed tools:
          -- require("sidekick.cli").select({ filter = { installed = true } })
          desc = "Select CLI",
        }
        for _, mode in ipairs { "n", "x" } do
          maps[mode][prefix .. "t"] = {
            function() require("sidekick.cli").send { name = cli_tool, msg = "{this}" } end,
            desc = "Send This",
          }
        end
        maps.x[prefix .. "v"] = {
          function() require("sidekick.cli").send { name = cli_tool, msg = "{selection}" } end,
          desc = "Send Visual Selection",
        }
        for _, mode in ipairs { "n", "x" } do
          maps[mode][prefix .. "p"] = {
            function() require("sidekick.cli").prompt { name = cli_tool } end,
            desc = "Sidekick Select Prompt",
          }
        end
        for _, mode in ipairs { "n", "x", "i", "t" } do
          maps[mode]["<c-.>"] = {
            function() require("sidekick.cli").focus() end,
            desc = "Sidekick Switch Focus",
          }
        end
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { Sidekick = "" } } },
  },
  opts = {
    nes = {
      enabled = true,
    },
    cli = {
      mux = {
        backend = vim.g.sidekick_mux_backend or "tmux", -- tmux / zellij
        enabled = true,
      },
    },
  },
  -- TODO: see how we want to handle tabs, I think we'll need to do something so it works with existing tab to do inline completions
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").next_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
  },
}
