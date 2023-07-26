return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        { "f<Enter>", desc = "Highlight" },
        { "f<BS>", desc = "Remove Highlight" },
        { "f<C-L>", desc = "Clear Highlight" },
        { "f<Tab>", desc = "Find Highlight (similar to Telescope grep)" },
        { "nn", "<cmd>Hi><CR>", desc = "Next Recently Set Highlight" },
        { "ng", "<cmd>Hi<<CR>", desc = "Previous Recently Set Highlight" },
        { "n[", "<cmd>Hi{<CR>", desc = "Next Nearest Highlight" },
        { "n]", "<cmd>Hi}<CR>", desc = "Previous Nearest Highlight" },
      },
    },
  },
  {
    "azabiong/vim-highlighter",
    lazy = false, -- Not Lazy by default
  },
}
