return {
  {
    "levouh/tint.nvim",
    init = function() table.insert(astronvim.file_plugins, "tint.nvim") end,
    opts = {
      highlight_ignore_patterns = { "WinSeparator", "neo-tree", "Status.*" },
      tint = -45, -- Darken colors, use a positive value to brighten
      saturation = 0.6, -- Saturation to preserve
    },
  },
}
