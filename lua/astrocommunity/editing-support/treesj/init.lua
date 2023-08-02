return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>m"] = { "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
        },
      },
    },
  },

  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
}
