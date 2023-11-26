# zk-nvim

Neovim extension for the [zk](https://github.com/mickael-menu/zk) plain text
note-taking assistant.

zk is a command-line tool helping you to maintain a plain text
[Zettelkasten](https://zettelkasten.de/introduction/) or personal wiki.

## Requirements

- Telescope

## This plugin pack does the following

Adds `zk-nvim`
Adds `zk` language server

## NOTE

This plugin will:

- setup and start the LSP server for you, do not call require("lspconfig").zk.setup().
- automatically attach buffers in a zk notebook that match the given filetypes
