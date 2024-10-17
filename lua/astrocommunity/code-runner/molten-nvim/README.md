# molten-nvim

A neovim plugin for interactively running code with the jupyter kernel. Fork of magma-nvim with improvements in image rendering, performance, and more.

## Required Python packages

- [`pynvim`](https://github.com/neovim/pynvim) (for the Remote Plugin API)
- [`jupyter_client`](https://github.com/jupyter/jupyter_client) (for interacting with Jupyter)

## Optional Python packages:

- [`cairosvg`](https://cairosvg.org/) (for displaying SVG images with transparency)
  - If you don't need transparency, image.nvim can render svg images perfectly fine
- [`pnglatex`](https://pypi.org/project/pnglatex/) (for displaying TeX formulas)
- `plotly` and `kaleido` (for displaying Plotly figures)
- `pyperclip` if you want to use `molten_copy_output`
- `nbformat` for importing and exporting output to jupyter notebooks files
- `pillow` for opening images with `:MoltenImagePopup`

> [!TIP]
> You can run `:checkhealth` to see what you have installed.

> [!CAUTION]
> For up to date docs, visit the repository.

**Repository:** <https://github.com/benlubas/molten-nvim>

## Customizations

This plugin config adds a custom init function for Python venvs. When calling `<Leader>mmp`, we check if a venv is activated. If it is, we check if a jupyter kernel spec for this venv already exists and `:MoltenInit` this kernel spec. If no kernel spec is found, we prompt for a unique name, create the kernel spec and `:MoltenInit` it.

It also adds a status line indication if molten is activated and what kernel is initialized.

> [!TIP]
> When using a global molten venv as described in the repository, we need to set the variable `python3_host_prog` to the Python executable there, which in AstroNVim is done in `AstroCore` in the `options.g` table, for example: `python3_host_prog = vim.fn.expand "~/.virtualenvs/neovim/bin/python3"`.
