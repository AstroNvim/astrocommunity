# copilot.lua + CMP

Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot

**Repository:** <https://github.com/zbirenbaum/copilot.lua>

## Key Features

- Seamless integration with nvim-cmp or blink.cmp
- Enhanced keybindings for Copilot suggestions:
  - `<Tab>` - Accept suggestion/Navigate completion menu
  - `<C-x>` / `<C-z>` - Next/Previous suggestion
  - `<C-right>` / `<C-l>` - Accept word
  - `<C-down>` / `<C-j>` - Accept line
  - `<C-c>` - Dismiss suggestion
 
_Note_: This plugin will also reconfigure `<Tab>` in AstroNvim to work with both auto completion in `cmp` and `copilot`.

The configuration includes support for [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [blink.cmp](https://github.com/Saghen/blink.cmp) for improved completion behavior.
