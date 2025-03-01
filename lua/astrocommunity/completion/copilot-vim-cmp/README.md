# copilot.vim + CMP

Integration of GitHub's official Copilot plugin with completion engines

**Repository:** <https://github.com/github/copilot.vim>

## Key Features

- Seamless integration with nvim-cmp or blink.cmp
- Enhanced keybindings for Copilot suggestions:
  - `<Tab>` - Accept suggestion/Navigate completion menu
  - `<M-[>` / `<M-]>` - Previous/Next suggestion
  - `<M-\>` - Suggest completions
  - `<M-Right>` - Accept word
  - `<M-C-Right>` - Accept line
  - `<C-]>` - Dismiss suggestion

_Note_: This plugin will also reconfigure `<Tab>` in AstroNvim to work with both auto completion in `cmp` and `copilot`.

The configuration includes support for [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [blink.cmp](https://github.com/Saghen/blink.cmp) for improved completion behavior.
