return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["s"] = {
            "<Plug>(leap-forward-to)",
            desc = "Leap forward to",
          },
          ["S"] = {
            "<Plug>(leap-backward-to)",
            desc = "Leap backward to",
          },
          ["gs"] = {
            "<Plug>(leap-from-window)",
            desc = "Leap from window",
          },
        },
        x = {
          ["s"] = {
            "<Plug>(leap-forward-to)",
            desc = "Leap forward to",
          },
          ["S"] = {
            "<Plug>(leap-backward-to)",
            desc = "Leap backward to",
          },
          ["x"] = {
            "<Plug>(leap-forward-till)",
            desc = "Leap forward till",
          },
          ["X"] = {
            "<Plug>(leap-backward-till)",
            desc = "Leap backward till",
          },
          ["gs"] = {
            "<Plug>(leap-from-window)",
            desc = "Leap from window",
          },
        },
        o = {
          ["s"] = {
            "<Plug>(leap-forward-to)",
            desc = "Leap forward to",
          },
          ["S"] = {
            "<Plug>(leap-backward-to)",
            desc = "Leap backward to",
          },
          ["x"] = {
            "<Plug>(leap-forward-till)",
            desc = "Leap forward till",
          },
          ["X"] = {
            "<Plug>(leap-backward-till)",
            desc = "Leap backward till",
          },
          ["gs"] = {
            "<Plug>(leap-from-window)",
            desc = "Leap from window",
          },
        },
      },
    },
  },
  {
    "ggandor/leap.nvim",
    opts = {},
    init = function() -- https://github.com/ggandor/leap.nvim/issues/70#issuecomment-1521177534
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          vim.cmd.hi("Cursor", "blend=100")
          vim.opt.guicursor:append { "a:Cursor/lCursor" }
        end,
        pattern = "LeapEnter",
      })
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          vim.cmd.hi("Cursor", "blend=0")
          vim.opt.guicursor:remove { "a:Cursor/lCursor" }
        end,
        pattern = "LeapLeave",
      })
    end,
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { leap = true } },
  },
}
