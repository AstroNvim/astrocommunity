return {
  {
    "Rawnly/gist.nvim",
    dependencies = {
      {
        "samjwill/nvim-unception",
        lazy = false,
        init = function() vim.g.unception_block_while_host_edits = true end,
      },
    },
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    config = function()
      require("gist").setup {
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
      }
    end,
  },
}
