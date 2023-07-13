return {
  "chipsenkbeil/distant.nvim",
  branch = "v0.2",
  event = "CmdlineEnter",
  config = function()
    require("distant").setup {
      -- Applies Chip's personal settings to every machine you connect to

      -- 1. Ensures that distant servers terminate with no connections
      -- 2. Provides navigation bindings for remote directories
      -- 3. Provides keybinding to jump into a remote file's parent directory
      ["*"] = require("distant.settings").chip_default(),
    }
  end,
}
