# Obsidian.nvim

Neovim plugin for Obsidian, written in Lua

**Repository:** <https://github.com/obsidian-nvim/obsidian.nvim>

A Neovim plugin for writing and navigating an [Obsidian](https://obsidian.md) vault, written in Lua.

This config assumes the vault location is at `~/obsidian-vault`. You can move the vault there. If you instead want to change the location in the config, you can create a new file `plugins/obsidian.lua`, copy the contents of this `init.lua` to it, and then edit the 2 following lines

`event = { "BufReadPre  */obsidian-vault/*.md" },`

and

`dir = "~/obsidian-vault",`

to match your vault location. 

We set `mappings` to an empty table, because `gf` is used for lazy loading in `keys`  
if you don't want `gf` for lazy loading, you should remove `keys` and `mappings` tables


The plugin may also nag and ask you to create a `templates` directory in the vault. You can use `mkdir templates` to create an empty directory.
