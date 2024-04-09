-- theme colors
local colors = {
  dark = "#111317",
  light = "#777777",
  neutral = "#8094B4",
  backdrop = "#61afef",
}
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        -- highlight groups are set based on astrotheme
        highlights = {
          astrotheme = { -- set your colorscheme name here
            -- indentline marker
            NeoTreeIndentMarker = { fg = colors.neutral },

            -- file tree window separator
            NeoTreeWinSeparator = { fg = colors.dark, bg = colors.dark },

            -- info messages
            NeoTreeMessage = { link = "NeoTreeDotfile" },

            -- normal mode appearance
            NeoTreeNormal = { bg = colors.dark },
            NeoTreeNormalNC = { link = "NeoTreeNormal" },

            -- dotfiles
            NeoTreeDotfile = { fg = colors.light },
            NeoTreeDotfiles = { link = "NeoTreeDotfile" },

            -- tabs
            NeoTreeTabActive = { fg = colors.dark, bg = colors.backdrop, bold = true },
            NeoTreeTabInactive = { fg = colors.light, bg = colors.dark },

            -- tab separators
            NeoTreeTabSeparatorActive = { fg = colors.backdrop, bg = colors.backdrop },
            NeoTreeTabSeparatorInactive = { link = "NeoTreeWinSeparator" },

            -- file operations prompt
            NeoTreeTitleBar = { link = "NeoTreeTabActive" },
            NeoTreeFloatNormal = { bg = colors.dark },
            NeoTreeFloatBorder = { fg = colors.backdrop, bg = colors.dark },
          },
        },
      },
    },
  },
  opts = {
    default_component_configs = {
      git_status = {
        symbols = {
          added = "󰬈", -- set icon for git symbols
          modified = "󰬔",
          deleted = "󰬋",
          renamed = "󰬙",
          untracked = "󰬛",
          ignored = "󰬐",
          unstaged = "󰬜",
          staged = "󰬚",
          conflict = "󰬊",
        },
      },
    },
  },
}
