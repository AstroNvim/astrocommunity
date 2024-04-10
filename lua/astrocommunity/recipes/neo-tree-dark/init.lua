-- theme colors
local colors = {
  dark = "#111317",
  light = "#777777",
  neutral = "#8094B4",
  backdrop = "#61afef",
}

local new_highlights = {
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
}

return {
  "AstroNvim/astroui",
  ---@param opts AstroUIOpts
  opts = function(_, opts)
    if not opts.highlights then opts.highlights = {} end
    local astrodark = opts.highlights.astrodark
    if type(astrodark) == "function" then
      opts.highlights.astrodark = function(...) return require("astrocore").extend_tbl(astrodark(...), new_highlights) end
    else
      opts.highlights.astrodark = require("astrocore").extend_tbl(astrodark, new_highlights)
    end

    if not opts.icons then opts.icons = {} end
    opts.icons.GitAdd = "󰬈" -- set icon for git symbols
    opts.icons.GitChange = "󰬔"
    opts.icons.GitDelete = "󰬋"
    opts.icons.GitRenamed = "󰬙"
    opts.icons.GitUntracked = "󰬛"
    opts.icons.GitIgnored = "󰬐"
    opts.icons.GitUnstaged = "󰬜"
    opts.icons.GitStaged = "󰬚"
    opts.icons.GitConflict = "󰬊"
  end,
}
