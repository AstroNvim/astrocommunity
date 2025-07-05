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
      optional = true,

      opts = function(_, opts)
        opts.statusline = opts.statusline or {}
        local spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        local astroui = require "astroui.status.hl"
        table.insert(opts.statusline, {
          static = {
            processing = false,
            spinner_index = 1,
            spinner_timer = nil,
            start_spinner = function(self)
              if self.spinner_timer then return end
              self.spinner_timer = vim.loop.new_timer()
              self.spinner_timer:start(
                0,
                100,
                vim.schedule_wrap(function()
                  self.spinner_index = (self.spinner_index % #spinner_symbols) + 1
                  vim.cmd "redrawstatus"
                end)
              )
            end,
            stop_spinner = function(self)
              if self.spinner_timer then
                self.spinner_timer:stop()
                self.spinner_timer:close()
                self.spinner_timer = nil
                self.spinner_index = 1
              end
            end,
          },
          start_generation = function() vim.api.nvim_exec_autocmds("User", { pattern = "CodeCompanionRequestStarted" }) end,
          end_generation = function() vim.api.nvim_exec_autocmds("User", { pattern = "CodeCompanionRequestFinished" }) end,
          update = {
            "User",
            pattern = "CodeCompanionRequest*",
            callback = function(self, args)
              if args.match == "CodeCompanionRequestStarted" then
                self.processing = true
                self:start_spinner()
              elseif args.match == "CodeCompanionRequestFinished" then
                self.processing = false
                self:stop_spinner()
              end
              vim.cmd "redrawstatus"
            end,
          },
          {
            condition = function(self) return self.processing end,
            provider = function(self) return spinner_symbols[self.spinner_index] .. " Processing..." end,
            hl = function() return astroui.filetype_color() end,
          },
        })
      end,
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
  },
}
