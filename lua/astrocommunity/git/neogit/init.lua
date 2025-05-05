return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "AstroNvim/astroui", opts = { icons = { Neogit = "󰰔" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>g"
        maps.n[prefix .. "n"] = { desc = require("astroui").get_icon("Neogit", 1, true) .. "Neogit" }
        maps.n[prefix .. "nt"] = { "<Cmd>Neogit<CR>", desc = "Open Neogit Tab Page" }
        maps.n[prefix .. "nc"] = { "<Cmd>Neogit commit<CR>", desc = "Open Neogit Commit Page" }
        maps.n[prefix .. "nd"] = { ":Neogit cwd=", desc = "Open Neogit Override CWD" }
        maps.n[prefix .. "nk"] = { ":Neogit kind=", desc = "Open Neogit Override Kind" }
        maps.n[prefix .. "nf"] = { "<Cmd>Neogit kind=floating<CR>", desc = "Open Neogit Float" }
        maps.n[prefix .. "nh"] = { "<Cmd>Neogit kind=split<CR>", desc = "Open Neogit Horizontal Split" }
        maps.n[prefix .. "nv"] = { "<Cmd>Neogit kind=vsplit<CR>", desc = "Open Neogit Vertical Split" }
      end,
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { neogit = true } },
    },
  },
  event = "User AstroGitFile",
  opts = function(_, opts)
    local utils = require "astrocore"
    local disable_builtin_notifications = utils.is_available "nvim-notify" or utils.is_available "noice.nvim"
    if utils.is_available "snacks.nvim" then
      local snacks_notifier = utils.plugin_opts("snacks.nvim").notifier
      if snacks_notifier and vim.tbl_get(snacks_notifier, "enabled") ~= false then
        disable_builtin_notifications = true
      end
    end

    return utils.extend_tbl(opts, {
      disable_builtin_notifications = disable_builtin_notifications,
      disable_signs = true,
      telescope_sorter = function()
        if utils.is_available "telescope-fzf-native.nvim" then
          return require("telescope").extensions.fzf.native_fzf_sorter()
        end
      end,
      integrations = {
        telescope = utils.is_available "telescope.nvim",
        diffview = utils.is_available "diffview.nvim",
        fzf_lua = utils.is_available "fzf-lua",
        mini_pick = utils.is_available "mini.pick",
        snacks = utils.is_available "snacks.nvim",
      },
    })
  end,
}
