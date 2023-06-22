# C/C++ Language Pack

This plugin pack does the following:

- Adds `cpp` `c` `objc` `cuda` `proto` Treesitter parsers
- Adds `clangd` language server
- Adds `clang-format` formatter
- Adds [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim) for language specific tooling
- Adds [cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim) for building and debugging

tips: the offset_encondings of clangd will confilicts whit null-ls, so add the following file in your user_config.

```lua
-- <user_config_path>/lsp/config/clangd.lua
return {
  capabilities = {
     offsetEncoding = "utf-8",
  },
}
```
