local utils = require "astrocore"
local prefix = "<leader>g"
local icon = vim.g.icons_enabled and "󰰔 " or ""
-- utils.set_mappings { n = { [prefix] = { desc = icon .. "Neogit" } } }
local ui_utils = require "astroui"

local fold_signs = { ui_utils.get_icon "FoldClosed", ui_utils.get_icon "FoldOpened" }
return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          [prefix] = { desc = icon .. "Neogit" },
          [prefix .. "nt"] = { "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
          [prefix .. "nc"] = { "<cmd>Neogit commit<CR>", desc = "Open Neogit Commit Page" },
          [prefix .. "nd"] = { ":Neogit cwd=", desc = "Open Neogit Override CWD" },
          [prefix .. "nk"] = { ":Neogit kind=", desc = "Open Neogit Override Kind" },
        },
      },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "User AstroGitFile",
    opts = function(_, opts)
      local disable_builtin_notifications = utils.is_available "nvim-notify" or utils.is_available "noice.nvim"

      return utils.extend_tbl(opts, {
        disable_builtin_notifications = disable_builtin_notifications,
        telescope_sorter = function()
          if utils.is_available "telescope-fzf-native.nvim" then
            return require("telescope").extensions.fzf.native_fzf_sorter()
          end
        end,
        integrations = { telescope = utils.is_available "telescope.nvim" },
        signs = { section = fold_signs, item = fold_signs },
      })
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { neogit = true } },
  },
}
