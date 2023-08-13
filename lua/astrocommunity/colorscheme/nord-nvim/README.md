# nord.nvim

Neovim theme based off of the Nord Color Palette, written in lua with tree sitter support

**Repository:** <https://github.com/shaunsingh/nord.nvim>

**Note:** Until the maintainer fixes the problem, the theme is incompatible with semantic tokens ([issue](https://github.com/shaunsingh/nord.nvim/issues/143), you therefore have to turn off the feature otherwise many tokens will be the same color. (put this in the `polish` function of `lua/user/init.lua`:

```
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
```
