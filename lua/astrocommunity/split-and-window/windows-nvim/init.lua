return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          opt = {
            winwidth = 10,
            winminwidth = 10,
            equalalways = false,
          },
        },
      },
    },
  },
  opts = {},
  cmd = {
    "WindowsMaximize",
    "WindowsMaximizeVertically",
    "WindowsMaximizeHorizontally",
    "WindowsEqualize",
    "WindowsEnableAutowidth",
    "WindowsDisableAutowidth",
    "WindowsToggleAutowidth",
  },
}
