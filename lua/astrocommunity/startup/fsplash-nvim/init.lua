return {
  "jovanlanik/fsplash.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        fsplash_autostart = {
          {
            event = "VimEnter",
            desc = "Start fsplash when vim is opened with no arguments",
            callback = function()
              local should_skip = false
              if vim.fn.argc() > 0 or vim.fn.line2byte(vim.fn.line "$") ~= -1 or not vim.o.modifiable then
                should_skip = true
              else
                for _, arg in pairs(vim.v.argv) do
                  if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
                    should_skip = true
                    break
                  end
                end
              end
              if not should_skip then require("fsplash").open_window() end
            end,
          },
        },
      },
    },
  },
  specs = {
    { "goolord/alpha-nvim", optional = true, enabled = false },
    { "folke/snacks.nvim", optional = true, opts = {
      dashboard = { enabled = false },
    } },
    { "stevearc/resession.nvim", optional = true, opts = { extensions = { fsplash = {} } } },
  },
  opts = {
    lines = {
      "    ___         __             _   __      _         ",
      "   /   |  _____/ /__________  / | / /   __(_)___ ___ ",
      "  / /| | / ___/ __/ ___/ __ \\/  |/ / | / / / __ `__ \\",
      " / ___ |(__  ) /_/ /  / /_/ / /|  /| |/ / / / / / / /",
      "/_/  |_/____/\\__/_/   \\____/_/ |_/ |___/_/_/ /_/ /_/ ",
    },
    border = "none",
    highlights = {
      NormalFloat = { link = "Normal" },
    },
  },
}
