# Godot Language Pack

**Requirements:** `Godot` needs to be running to use LSP and DAP for gdscript

This plugin pack does the following:

- Sets up `gdscript` language server (expects to be running on port `6005` or `$GDScript_Port` environment variable)
- Configures `nvim-dap` for debugger listening on port `6006` or `$GDScript_Debug_Port` environment variable
- Adds `gdscript` treesitter parsers
- Adds `godot_resource` treesitter parsers
- Adds `glsl` treesitter parsers
- Adds [quickgd.nvim](https://github.com/QuickGD/quickgd.nvim)
