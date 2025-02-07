return {
  "folke/snacks.nvim",
  priority = 10000,
  lazy = false,
  ---@param opts snacks.Config
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      bigfile = { enabled = not vim.tbl_get(astrocore.config, "autocmds", "large_buf_settings") },
      notifier = {
        enabled = not astrocore.is_available "nvim-notify",
        timeout = 3000,
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = not astrocore.is_available "vim-illuminate" },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
    } --[[ @type snacks.Config ]])
  end,
  specs = {
    { "rcarriga/nvim-notify", enabled = false },
    { "RRethy/vim-illuminate", enabled = false },
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts)
        if vim.tbl_get(require("astrocore").plugin_opts "snacks.nvim", "statuscolumn", "enabled") then
          opts.statuscolumn = false
        end
      end,
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
            Snacks.toggle.option("spell", { name = "Spelling" }):map "<Leader>us"
            Snacks.toggle.option("wrap", { name = "Wrap" }):map "<Leader>uw"
            Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<Leader>uL"
            Snacks.toggle.diagnostics():map "<Leader>ud"
            Snacks.toggle.line_number():map "<Leader>ul"
            Snacks.toggle
              .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
              :map "<Leader>uc"
            Snacks.toggle.treesitter():map "<Leader>uT"
            Snacks.toggle
              .option("background", { off = "light", on = "dark", name = "Dark Background" })
              :map "<Leader>ub"
            Snacks.toggle.inlay_hints():map "<Leader>uh"
          end,
        }
        maps.n["<Leader>un"] = { function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" }
        maps.n["<Leader>bd"] = { function() Snacks.bufdelete() end, desc = "Delete Buffer" }
        maps.n["<Leader>gg"] = { function() Snacks.lazygit() end, desc = "Lazygit" }
        maps.n["<Leader>gb"] = { function() Snacks.git.blame_line() end, desc = "Git Blame Line" }
        maps.n["<Leader>gB"] = { function() Snacks.gitbrowse() end, desc = "Git Browse" }
        maps.n["<Leader>gf"] = { function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" }
        maps.n["<Leader>gl"] = { function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" }
        maps.n["<Leader>cR"] = { function() Snacks.rename() end, desc = "Rename File" }
        maps.n["<c-/>"] = { function() Snacks.terminal() end, desc = "Toggle Terminal" }
        maps.n["<c-_>"] = { function() Snacks.terminal() end, desc = "which_key_ignore" }
        maps.n["]r"] = { function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" }
        maps.n["[r"] = { function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" }
        maps.n["<Leader>N"] = {
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
          desc = "Neovim News",
        }
      end,
    },
  },
}
