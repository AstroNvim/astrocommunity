local prefix = "<Leader>c"
return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          v = {
            [prefix] = { desc = " CodeSnap" },
            [prefix .. "s"] = { ":'<,'>CodeSnap<CR>", desc = "CodeSnap (clipboard)" },
            [prefix .. "S"] = { ":'<,'>CodeSnapSave<CR>", desc = "CodeSnap (save)" },
          },
        },
      },
    },
  },
  opts = {
    mac_window_bar = false,
    watermark = "",
  },
}
