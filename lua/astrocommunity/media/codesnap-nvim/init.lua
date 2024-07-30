-- TODO: Remove extra version checking when CodeSnap adds Windows compatibility.
local prefix = "<Leader>c"
local is_windows = vim.fn.has "win32" ~= 0
return {
  "mistricky/codesnap.nvim",
  version = is_windows and "0.0.11" or nil, -- use the most suitable version for windows users otherwise the latest commit
  build = "make",
  cmd = is_windows and "CodeSnapPreviewOn"
    or { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapSaveHighlight" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          v = {
            [prefix] = { desc = " CodeSnap" },
            [prefix .. "s"] = { ":'<,'>CodeSnap<CR>", desc = "CodeSnap (clipboard)" },
            [prefix .. "S"] = { ":'<,'>CodeSnapSave<CR>", desc = "CodeSnap (save)" },
            [prefix .. "h"] = { ":'<,'>CodeSnapHighlight<CR>", desc = "CodeSnap with highlight (clipboard)" },
            [prefix .. "H"] = { ":'<,'>CodeSnapSaveHighlight<CR>", desc = "CodeSnap with highlight (save)" },
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
