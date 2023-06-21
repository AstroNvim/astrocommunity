# cpp Language Pack

This plugin pack does the following:

- Adds `cpp` `c` Treesitter parser
- Adds `clangd` language server
- Adds `clang-format` formatter

tips: the offset_encondings of clangd will confilicts whit null-ls, so add the following file in your user_config.
```lua
-- <user_config_path>/lsp/config/clangd.lua
return {
  capabilities = {
     offsetEncoding = "utf-8",
  },
}
```
