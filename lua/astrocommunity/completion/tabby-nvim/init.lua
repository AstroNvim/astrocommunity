return {
  "TabbyML/vim-tabby",
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          tabby_keybinding_accept = "<C-e>",
          tabby_keybinding_trigger_or_dismiss = "<C-\\>",
          tabby_node_binary = vim.fn.exepath "node",
        },
      },
    },
  },
}
