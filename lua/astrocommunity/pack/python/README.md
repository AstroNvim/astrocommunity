# Python Language Pack

**Requirements:** `python` must be in your `PATH` and executable

This is the base Python pack that provides core functionality:

- Adds `python` and `toml` Treesitter parsers
- Adds `debugpy` for debugging with `nvim-dap-python`
- Adds `venv-selector.nvim` for virtual environment selection
- Adds `neotest-python` for test running

## Subpacks

This pack can be combined with the following subpacks for additional tooling:

- [basedpyright](./basedpyright/) - Adds `basedpyright` language server
- [ruff](./ruff/) - Adds `ruff` language server for linting and formatting
- [isort](./isort/) - Adds `isort` formatter
- [black](./black/) - Adds `black` formatter

### Example Usage

```lua
-- Base pack only
{ import = "astrocommunity.pack.python.base" }

-- Base pack with basedpyright and ruff
{ import = "astrocommunity.pack.python.base" },
{ import = "astrocommunity.pack.python.basedpyright" },
{ import = "astrocommunity.pack.python.ruff" },

-- Base pack with basedpyright, black and isort
{ import = "astrocommunity.pack.python.base" },
{ import = "astrocommunity.pack.python.basedpyright" },
{ import = "astrocommunity.pack.python.black" },
{ import = "astrocommunity.pack.python.isort" },
```
