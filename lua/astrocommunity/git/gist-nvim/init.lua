return {
  "Rawnly/gist.nvim",
  cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
  opts = {
    private = false,
    clipboard = "+",
    list = {
      -- If there are multiple files in a gist you can scroll them,
      -- with vim-like bindings n/p next previous
      mappings = {
        next_file = "<C-n>",
        prev_file = "<C-p>",
      },
    },
  },
}
