return {
  "TabbyML/vim-tabby",
  init = function()
    vim.g.tabby_keybinding_accept = "<C-e>"
    vim.g.tabby_keybinding_trigger_or_dismiss = "<C-\\>"
    vim.g.tabby_node_binary = "/path/to/node"
  end,
}
