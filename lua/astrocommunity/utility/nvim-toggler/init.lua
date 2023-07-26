return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>i"] = { desc = "Toggle CursorWord" },
        },
      },
    },
  },
  {
    "nguyenvukhang/nvim-toggler",
    event = { "User AstroFile", "InsertEnter" },

    opts = {},
  },
}
