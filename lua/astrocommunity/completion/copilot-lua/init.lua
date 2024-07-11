return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "User AstroFile",
  opts = {
    filetypes = {
      ["grug-far"] = false,
      ["grug-far-history"] = false,
    },
    suggestion = {
      auto_trigger = true,
      debounce = 150,
    },
  },
}
