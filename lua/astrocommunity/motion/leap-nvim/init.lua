return {
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
      {
        "AstroNvim/astrocore",
        opts = {
          autocmds = {
            leap_cursor = { -- https://github.com/ggandor/leap.nvim/issues/70#issuecomment-1521177534
              {
                event = "User",
                pattern = "LeapEnter",
                callback = function()
                  vim.cmd.hi("Cursor", "blend=100")
                  vim.opt.guicursor:append { "a:Cursor/lCursor" }
                end,
              },
              {
                event = "User",
                pattern = "LeapLeave",
                callback = function()
                  vim.cmd.hi("Cursor", "blend=0")
                  vim.opt.guicursor:remove { "a:Cursor/lCursor" }
                end,
              },
            },
          },
          mappings = {
            n = {
              ["s"] = { "<Plug>(leap-forward-to)", desc = "Leap forward to" },
              ["S"] = { "<Plug>(leap-backward-to)", desc = "Leap backward to" },
              ["gs"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
            },
            x = {
              ["s"] = { "<Plug>(leap-forward-to)", desc = "Leap forward to" },
              ["S"] = { "<Plug>(leap-backward-to)", desc = "Leap backward to" },
              ["x"] = { "<Plug>(leap-forward-till)", desc = "Leap forward till" },
              ["X"] = { "<Plug>(leap-backward-till)", desc = "Leap backward till" },
              ["gs"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
            },
            o = {
              ["s"] = { "<Plug>(leap-forward-to)", desc = "Leap forward to" },
              ["S"] = { "<Plug>(leap-backward-to)", desc = "Leap backward to" },
              ["x"] = { "<Plug>(leap-forward-till)", desc = "Leap forward till" },
              ["X"] = { "<Plug>(leap-backward-till)", desc = "Leap backward till" },
              ["gs"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
            },
          },
        },
      },
    },
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { leap = true } },
  },
}
