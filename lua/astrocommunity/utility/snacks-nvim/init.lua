return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = false },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local Snacks = require "snacks"
        local maps = opts.mappings

        opts.autocmds.snacks_toggle = {
          event = "User",
          pattern = "VeryLazy",
          callback = function()
            -- Setup some globals for debugging (lazy-loaded)
            _G.dd = function(...) Snacks.debug.inspect(...) end
            _G.bt = function() Snacks.debug.backtrace() end
            vim.print = _G.dd -- Override print to use snacks for `:=` command

            -- Create some toggle mappings
            Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
            Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
            Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
            Snacks.toggle.diagnostics():map "<leader>ud"
            Snacks.toggle.line_number():map "<leader>ul"
            Snacks.toggle
              .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
              :map "<leader>uc"
            Snacks.toggle.treesitter():map "<leader>uT"
            Snacks.toggle
              .option("background", { off = "light", on = "dark", name = "Dark Background" })
              :map "<leader>ub"
            Snacks.toggle.inlay_hints():map "<leader>uh"
          end,
        }
        maps.n["<Leader>un"] = { function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" }
        maps.n["<leader>bd"] = { function() Snacks.bufdelete() end, desc = "Delete Buffer" }
        maps.n["<leader>gg"] = { function() Snacks.lazygit() end, desc = "Lazygit" }
        maps.n["<leader>gb"] = { function() Snacks.git.blame_line() end, desc = "Git Blame Line" }
        maps.n["<leader>gB"] = { function() Snacks.gitbrowse() end, desc = "Git Browse" }
        maps.n["<leader>gf"] = { function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" }
        maps.n["<leader>gl"] = { function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" }
        maps.n["<leader>cR"] = { function() Snacks.rename() end, desc = "Rename File" }
        maps.n["<c-/>"] = { function() Snacks.terminal() end, desc = "Toggle Terminal" }
        maps.n["<c-_>"] = { function() Snacks.terminal() end, desc = "which_key_ignore" }
        maps.n["]]"] = { function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" }
        maps.n["[["] = { function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" }
        maps.n["<leader>N"] = {
          function()
            Snacks.win {
              file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
              width = 0.6,
              height = 0.6,
              wo = {
                spell = false,
                wrap = false,
                signcolumn = "yes",
                statuscolumn = " ",
                conceallevel = 3,
              },
            }
          end,
        }
      end,
    },
  },
}
