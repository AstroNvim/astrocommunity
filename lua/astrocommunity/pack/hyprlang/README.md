# hyprlang Pack

This plugin pack offers language support for Hyprland config file. It does the following:

- Adds `hyprlang` filetype which will be assumed from below patterns:
  - `*.hl` extension
  - `.*/hypr/.*.conf`, `hypr.*.conf`
- Adds `hyprlang` Treesitter parsers

## Requirement

- Need to install `hyprls` tool first
  - if (mason-tool-installer)[https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim] has been loaded, then hyprls should be
    installed automatically
  - Execute `:Mason` to install hyprls via mason
