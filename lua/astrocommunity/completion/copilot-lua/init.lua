return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "User AstroFile",
  opts = { suggestion = {
    auto_trigger = true,
    debounce = 150,
    keymap = { accept = false },
  } },
  specs = {
    { import = "astrocommunity.recipes.ai" },
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
  },
}
