return { -- scrollbar
  {
    "lewis6991/satellite.nvim",
    init = function() table.insert(astronvim.file_plugins, "satellite.nvim") end,
    opts = {
      excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" },
    },
  },
}
