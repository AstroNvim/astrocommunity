return {
  "chipsenkbeil/distant.nvim",
  branch = "v0.2",
  cmd = {
    "DistantLaunch",
    "DistantOpen",
    "DistantConnect",
    "DistantInstall",
    "DistantMetadata",
    "DistantShell",
    "DistantShell",
    "DistantSystemInfo",
    "DistantClientVersion",
    "DistantSessionInfo",
    "DistantCopy",
  },
  opts = function(_, opts) opts["*"] = require("distant.settings").chip_default() end,
}
