# mini.snippets

Manage and expand snippets. Part of 'mini.nvim' library.

**Repository:** <https://github.com/echasnovski/mini.snippets>

Sets up:

- Leaving insert mode while in a snippet session ends the session
  - Disable by disabling the `mini_snippets_stop` autocommand `augroup` in AstroCore
- Configures the following snippet locations:
  - Global user snippets in `~/.config/nvim/snippets/global.json`
  - Language specific user snippets in `~/.config/nvim/snippets/<lang>.json`
  - Snippets in the runtime for plugins with a `snippets` folder such as `friendly-snippets`
  - Project local snippets including `.vscode/project.code-snippets` and `.vscode/<lang>.code-snippets`

Provided Integrations:

- Adds [`friendly-snippets`](https://github.com/rafamadriz/friendly-snippets)
- Disables LuaSnip
- Configures `blink.cmp` to use `mini.snippets` if it's available
- Configures `nvim-cmp` to use `mini.snippets` if it's available
