# Python Language Pack

**Requirements:** `python` must be in your `PATH` and executable

This plugin pack does the following:

- Adds `python` and `toml` Treesitter parsers
- Adds `pyright` and `ruff_lsp` language servers
- Adds the following `null-ls` sources:
  - [black](https://pypi.org/project/black/)
  - [isort](https://pypi.org/project/isort/)
- Adds `debugpy` for debugging
- Adds [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) for virtual environment management. [**Important for Debian-like distro users**](https://github.com/linux-cultist/venv-selector.nvim/issues/6): because of the fd binary being named fdfind you'll need to add to `/plugins/user.lua` (for example) the following:
```
{
  "linux-cultist/venv-selector.nvim",
  opts = {
    fd_binary_name = "fdfind",
  },
},
```
