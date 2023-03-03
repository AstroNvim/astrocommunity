return {
  "lukas-reineke/indent-blankline.nvim",
  init = function() table.insert(astronvim.file_plugins, "indent-blankline.nvim") end,
  opts = {
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
    show_trailing_blankline_indent = false,
    show_current_context = false,
  },
}
