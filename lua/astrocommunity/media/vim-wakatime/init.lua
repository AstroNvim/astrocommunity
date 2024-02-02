return { 
  "wakatime/vim-wakatime",
  event = "User AstroFile",
  setup = function()
    vim.cmd([[packadd wakatime/vim-wakatime]])
  end,
}
