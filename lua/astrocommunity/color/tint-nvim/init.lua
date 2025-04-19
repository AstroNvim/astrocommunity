return {
  "levouh/tint.nvim",
  event = "User AstroFile",
  opts = {
    highlight_ignore_patterns = { "WinSeparator", "NeoTree", "Status.*" },
    tint = -45, -- Darken colors, use a positive value to brighten
    saturation = 0.6, -- Saturation to preserve
  },
}
