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
