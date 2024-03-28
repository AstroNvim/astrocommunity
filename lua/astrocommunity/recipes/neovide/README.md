# Neovide Configuration for AstroNvim

**Website:** <https://docs.astronvim.com/recipes/neovide>

## Features

- Adjust the scale factor incrementally to find the perfect size for your needs.
- Reset the scale factor to its initial value for a consistent starting point.

## Global Variables (`vim.g`)

This recipe uses several global variables to configure its behavior.

- `neovide_scale_factor` (default: 1) - The current scale factor of Neovide.
- `neovide_increment_scale_factor` (default: 0.1) - Determines the increment/decrement value for adjusting the scale factor.
- `neovide_min_scale_factor` (default: 0.7) - The minimum scale allowed.
- `neovide_max_scale_factor` (default: 2.0) - The maximum scale allowed.
- `neovide_initial_scale_factor` (default: from `neovide_scale_factor`) - Used to have the scale factor reset to the initial value.

## Commands

### `:NeovideSetScaleFactor {scale_factor:number} [force]`

Sets the Neovide scale factor. If `force` is provided as the second argument, the scale factor is set without applying the minimum and maximum constraints.

### `:NeovideResetScaleFactor`

Resets the scale factor to `vim.g.neovide_initial_scale_factor`.

## Keybindings

| Mappings   | Action                                                                |
| ---------- | --------------------------------------------------------------------- |
| `Ctrl + =` | Increase the Neovide scale factor by `neovide_increment_scale_factor` |
| `Ctrl + -` | Decrease the Neovide scale factor by `neovide_increment_scale_factor` |
| `Ctrl + 0` | Reset the Neovide scale factor to `neovide_initial_scale_factor`      |
