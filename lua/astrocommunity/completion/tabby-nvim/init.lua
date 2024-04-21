return {
  { "TabbyML/vim-tabby" },
  init = function()
    -- Configuration settings for vim-tabby
    vim.g.tabby_keybinding_accept = "<Tab>"
    vim.g.tabby_keybinding_trigger_or_dismiss = "<C-\\>"
    vim.g.tabby_node_binary = "/path/to/node"

    -- You can also set key mappings here if vim-tabby requires them
    -- vim.keymap.set('n', '<your-key>', '<vim-command-or-function>')
  end,
}
