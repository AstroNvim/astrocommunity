# Godot Language Pack

**Requirements:** Godot needs to be running to use LSP and DAP for GDScript

This plugin pack does the following:

- Sets up `gdscript` language server (expects to be running on port `6005` or `$GDScript_Port` environment variable)
- Configures `nvim-dap` for debugger listening on port `6006` or `$GDScript_Debug_Port` environment variable
- Adds `gdscript` treesitter parsers
- Adds `godot_resource` treesitter parsers
- Adds `glsl` treesitter parsers
- Adds [quickgd.nvim](https://github.com/QuickGD/quickgd.nvim) to provide commands for starting Godot
- Adds [godot-server.nvim](https://github.com/Cretezy/godot-server.nvim) to open files from Godot in Neovim. Requires configuration in the Godot editor (see [project page](https://github.com/Cretezy/godot-server.nvim))
