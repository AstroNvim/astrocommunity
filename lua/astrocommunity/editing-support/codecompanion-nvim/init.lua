local prefix = "<Leader>A"

return {
  "olimorris/codecompanion.nvim",
  event = "User AstroFile",
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
  specs = {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local CodeCompanion = {
          static = {
            processing = false,
          },
          update = {
            "User",
            pattern = "CodeCompanionRequest*",
            callback = function(self, args)
              if args.match == "CodeCompanionRequestStarted" then
                self.processing = true
              elseif args.match == "CodeCompanionRequestFinished" then
                self.processing = false
              end
              vim.cmd "redrawstatus"
            end,
          },
          {
            condition = function(self) return self.processing end,
            provider = " ",
            hl = { fg = "yellow" },
          },
        }
        table.insert(opts.statusline or {}, CodeCompanion)
      end,
    },
    {
      "ravitemer/codecompanion-history.nvim",
      opts = {
        extensions = {
          history = {
            enabled = true,
            opts = {
              keymap = "gh",
              save_chat_keymap = "sc",
              auto_save = true,
              expiration_days = 0,
              picker_keymaps = {
                rename = { n = "r", i = "<M-r>" },
                delete = { n = "d", i = "<M-d>" },
                duplicate = { n = "<C-y>", i = "<C-y>" },
              },
              auto_generate_title = true,
              title_generation_opts = {
                adapter = nil, -- "copilot"
                model = nil, -- "gpt-4o"
                refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
                max_refreshes = 3,
              },
              continue_last_chat = false,
              delete_on_clearing_chat = false,
              dir_to_save = vim.fn.stdpath "data" .. "/codecompanion-history",
              enable_logging = false,
              chat_filter = nil, -- function(chat_data) return boolean end
            },
          },
        },
      },
    },
    { "AstroNvim/astroui", opts = { icons = { CodeCompanion = "󱙺" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        if not opts.mappings then opts.mappings = {} end
        opts.mappings.n = opts.mappings.n or {}
        opts.mappings.v = opts.mappings.v or {}
        opts.mappings.n[prefix] = { desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "CodeCompanion" }
        opts.mappings.v[prefix] = { desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "CodeCompanion" }
        opts.mappings.n[prefix .. "c"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle chat" }
        opts.mappings.v[prefix .. "c"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle chat" }
        opts.mappings.n[prefix .. "p"] = { "<cmd>CodeCompanionActions<cr>", desc = "Open action palette" }
        opts.mappings.v[prefix .. "p"] = { "<cmd>CodeCompanionActions<cr>", desc = "Open action palette" }
        opts.mappings.n[prefix .. "q"] = { "<cmd>CodeCompanion<cr>", desc = "Open inline assistant" }
        opts.mappings.v[prefix .. "q"] = { "<cmd>CodeCompanion<cr>", desc = "Open inline assistant" }
        opts.mappings.v[prefix .. "a"] = { "<cmd>CodeCompanionChat Add<cr>", desc = "Add selection to chat" }
        vim.cmd [[cab cc CodeCompanion]]
      end,
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.file_types then opts.file_types = { "markdown" } end
        opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "codecompanion" })
      end,
    },
    {
      "OXY2DEV/markview.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.preview then opts.preview = {} end
        if not opts.preview.filetypes then opts.preview.filetypes = { "markdown", "quarto", "rmd" } end
        opts.preview.filetypes = require("astrocore").list_insert_unique(opts.preview.filetypes, { "codecompanion" })
      end,
    },
    {
      "folke/snacks.nvim",
      optional = true,
      specs = {
        {
          "olimorris/codecompanion.nvim",
          opts = {
            display = {
              action_palette = {
                provider = "snacks",
              },
            },
          },
        },
      },
    },
  },
}
