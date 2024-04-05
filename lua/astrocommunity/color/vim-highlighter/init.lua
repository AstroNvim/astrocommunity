return {
  "azabiong/vim-highlighter",
  lazy = false, -- Not Lazy by default
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["nn"] = { "<Cmd>Hi><CR>", desc = "Next Recently Set Highlight" },
            ["ng"] = { "<Cmd>Hi<<CR>", desc = "Previous Recently Set Highlight" },
            ["n["] = { "<Cmd>Hi{<CR>", desc = "Next Nearest Highlight" },
            ["n]"] = { "<Cmd>Hi}<CR>", desc = "Previous Nearest Highlight" },
          },
        },
      },
    },
  },
}
