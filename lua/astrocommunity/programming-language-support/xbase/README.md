# XBase

## Note

xbase is a WIP plugin, and the experience provided by this plugin might be
lackluster.

## Tip

You should also include the swift pack for basic language support. To add it into your setup, add:
```lua
  ...
  {import ="astrocommunity.pack.swift"}
```

## Requirements

1. Make sure you have [sourcekit-lsp](https://github.com/apple/sourcekit-lsp)
   installed on your machine.

2. Install Xcode Device Simulators: To enable simulator functionality from
   within Neovim, you need to have Xcode Device Simulators installed on your
machine. You can install these simulators from Xcode.

3. Mappings: The default mappings for the xbase plugin overlap with AstroNvim's
   default. Therefore, you should set the mappings yourself. Refer to
[xBase](https://github.com/kkharji/xbase#neovim-3) documentation for more
options.

```lua
opts = {
  -- ... (other options)

  mappings = {
    enable = true,
    build_picker = "<leader>rb", -- Set to 0 to disable
    run_picker = "<leader>ra", -- Set to 0 to disable
    watch_picker = 0, -- Set to 0 to disable
    all_picker = 0, -- Set to 0 to disable
    toggle_split_log_buffer = 0,
    toggle_vsplit_log_buffer = "<leader>rs",
  },

  -- ... (other options)
}
```
