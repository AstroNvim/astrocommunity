return {
  { "goolord/alpha-nvim", enabled = false },
  {
    "jovanlanik/fsplash.nvim",
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        desc = "Start fsplash when vim is opened with no arguments",
        group = vim.api.nvim_create_augroup("fsplash_autostart", { clear = true }),
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
      })
    end,
    opts = {
      lines = {
        "    ___         __             _   __      _         ",
        "   /   |  _____/ /__________  / | / /   __(_)___ ___ ",
        "  / /| | / ___/ __/ ___/ __ \\/  |/ / | / / / __ `__ \\",
        " / ___ |(__  ) /_/ /  / /_/ / /|  /| |/ / / / / / / /",
        "/_/  |_/____/\\__/_/   \\____/_/ |_/ |___/_/_/ /_/ /_/ ",
      },
      highlights = {
        ["NormalFloat"] = { link = "Normal" },
      },
    },
  },
  { "stevearc/resession.nvim", optional = true, opts = { extensions = { fsplash = {} } } },
}
