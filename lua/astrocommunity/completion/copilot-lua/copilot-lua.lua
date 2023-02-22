return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    init = function() table.insert(astronvim.file_plugins, "copilot.lua") end,
    opts = { suggestion = { auto_trigger = true, debounce = 150 } },
  },
}
