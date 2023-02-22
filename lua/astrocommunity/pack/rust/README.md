WIP

setup_handlers.lua

```lua
local function fallback_setup(plugin, server, opts)
  local lsp_plugin_avail, _ = pcall(require, plugin)
  if not lsp_plugin_avail then require("lspconfig")[server].setup(opts) end
end

return {
  rust_analyzer = function(...) fallback_setup("rust-tools", ...) end,
}
```
