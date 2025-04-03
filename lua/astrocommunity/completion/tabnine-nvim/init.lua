return {
  "codota/tabnine-nvim",
  main = "tabnine",
  build = vim.loop.os_uname().sysname == "Windows_NT" and "pwsh.exe -file .\\dl_binaries.ps1" or "./dl_binaries.sh",
  cmd = { "TabnineStatus", "TabnineDisable", "TabnineEnable", "TabnineToggle" },
  event = "User AstroFile",
  opts = { accept_keymap = false },
  specs = {
    { import = "astrocommunity.recipes.ai" },
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("tabnine.keymaps").has_suggestion() then
                require("tabnine.keymaps").accept_suggestion()
                return true
              end
            end,
          },
        },
      },
    },
  },
}
