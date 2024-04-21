# tabby-nvim

Tabby is a self-hosted AI coding assistant that can suggest multi-line code or full functions in real-time.

**Repository:** <https://github.com/TabbyML/vim-tabby>

### Default Mappings

| Mappings   | Action            |
|------------|-------------------|
| `Tab`      | Accept completion |
| `Ctrl + \` | Trigger/Dismiss   |

## Known Conflicts

    For the default settings, Tabby will attempt to set up the <Tab> key mapping. If Tabby's inline completion is not displayed, it will fall back to the original mapping. However, this approach might not work when there is a conflict with other plugins that also map the <Tab> key, as they could overwrite Tabby's mapping. In such cases, you can use a different keybinding to accept the completion and avoid conflicts.

    Tabby internally utilizes the <C-R><C-O> command to insert the completion. If you have mapped <C-R> to other functions, you won't be able to accept the completion. In such scenarios, you may need to manually modify the function tabby#Accept() in autoload/tabby.vim.
