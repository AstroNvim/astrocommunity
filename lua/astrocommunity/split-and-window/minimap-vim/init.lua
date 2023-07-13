return {
  "wfxr/minimap.vim",
  lazy = false,
  cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  init = function()
    vim.cmd "let g:minimap_width = 10"
    vim.cmd "let g:minimap_auto_start = 1"
    vim.cmd "let g:minimap_auto_start_win_enter = 1"
  end,
}
