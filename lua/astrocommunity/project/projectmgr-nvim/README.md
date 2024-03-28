# projectmgr.nvim

Quickly switch between projects and automate startup tasks.

**Repository:** <https://github.com/charludo/projectmgr.nvim>

### 🦑 Usage with `telescope.nvim`

`:ProjectMgr` (or <Leader>P) toggles a telescope picker with your projects. The telescope preview displays information about your project
and its current git state.
The following actions and keybinds are available:

| Key               | Action                                                                                             |
| :---------------- | :------------------------------------------------------------------------------------------------- |
| `<CR>`            | Open the project under your cursor                                                                 |
| `<C-a>`           | Add a project. You will be asked for a name, a path, and optionally startup and shutdown commands. |
| `<C-d>` / `<C-x>` | Delete project under your cursor                                                                   |
| `<C-e>` / `<C-u>` | Edit the project under your cursor                                                                 |
| `<C-q>` / `<ESC>` | Close the window without doing anything                                                            |
| `<Leader>P`       | Open the ProjectMgr panel                                                                          |

### 🦑 Usage without `telescope.nvim`

**projectmgr** comes with a fallback window in case you aren't using `telescope.nvim`. The same actions are available.
The keybinds are slightly different: `<C-a>` is replaced by just `a`, `<C-q>` becomes just `q`, and so on.
