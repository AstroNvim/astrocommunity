# VS Code Integration Support

**Website:** <https://docs.astronvim.com/recipes/vscode>

Some users may be wanting to integrate their Neovim configuration with their VS Code editor. This spec configures AstroNvim to play nicely with the VS Code Extension [`vscode-neovim`](https://github.com/vscode-neovim/vscode-neovim).

This plugin spec works by overriding the default `cond` function in `lazy.nvim`. If you want to enable one of your own plugins, you can simply add `cond = true` to the plugin spec or set it to your own function for doing computation when deciding how to conditionally enable the plugin. See the [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec) for details on doing more advanced modification of the condition.

If there are more plugins that play nicely with the `vscode-neovim` extension, feel free to make a PR to add it to the list of enabled plugins!
