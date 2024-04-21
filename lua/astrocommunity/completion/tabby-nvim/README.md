# tabby-nvim

Tabby is a self-hosted AI coding assistant that can suggest multi-line code or full functions in real-time.

**Repository:** <https://github.com/TabbyML/vim-tabby>

### Default Mappings

| Mappings   | Action            |
|------------|-------------------|
| `<C-e>`    | Accept completion |
| `Ctrl + \` | Trigger/Dismiss   |

## Known Conflicts

- Tabby internally utilizes the `<C-R><C-O>` command to insert the completion. If you have mapped `<C-R>` to other functions, you won't be able to accept the completion. In such scenarios, you may need to manually modify the function `tabby#Accept()` in [`autoload/tabby.vim`](https://github.com/TabbyML/tabby/tree/main/clients/vim/autoload/tabby.vim).
