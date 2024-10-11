# copilot.lua within CMP

Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot

**Repositories:** 
<https://github.com/zbirenbaum/copilot.lua>
<https://github.com/zbirenbaum/copilot-cmp>

_Note_: This plugin will also reconfigure `cmp` and add `copilot` as a completion source
_Note 2_: This configuration adds a nerdfont icon for copilot using `lspkind`. If you are using regular characters, you can change it in your plugin setup, using the key `Copilot` for `lspkind`'s `buffer_map`

_Note 3_: to override, create a `~/.config/nvim/lua/plugins/copilot-override.lua` with content like this

```lua
return {
  "zbirenbaum/copilot.lua",
  opts = {
    filetypes = {
      markdown = true, -- Explicitly enable markdown
    },
  },
}
```
