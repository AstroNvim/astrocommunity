return {
  "codota/tabnine-nvim",
  name = "tabnine",
  build = vim.loop.os_uname().sysname == "Windows_NT" and "pwsh.exe -file .\\dl_binaries.ps1" or "./dl_binaries.sh",
  cmd = { "TabnineStatus", "TabnineDisable", "TabnineEnable", "TabnineToggle" },
  event = "User AstroFile",
  opts = { accept_keymap = "<C-e>" },
}
