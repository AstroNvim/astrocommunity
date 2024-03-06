# Neovide Configuration for AstroNvim

**Website:** <https://docs.astronvim.com/recipes/neovide>

## Features

- Adjust the scale factor incrementally to find the perfect size for your needs.
- Reset the scale factor to its initial value for a consistent starting point.

## Global Variables

This recipe uses several global variables to configure its behavior.

- `neovide_scale_factor` (default: 1) - The current scale factor of Neovide.
- `neovide_change_scale_factor` (default: 0.1) - Determines the increment/decrement value for adjusting the scale factor.
- `neovide_min_scale_factor` (default: 0.7) - The minimum scale allowed.
- `neovide_max_scale_factor` (default: 2.0) - The maximum scale allowed.
- `neovide_initial_scale_factor` (default: from `neovide_scale_factor`) - Used to have the scale factor reset to the initial value.

## Commands

### Adjusting Scale Factor

`:NeovideSetScaleFactor {scale_factor:number} [force]`

Sets the Neovide scale factor. If `force` is provided as the second argument, the scale factor is set without applying the minimum and maximum constraints.

### Resetting Scale Factor

`:NeovideResetScaleFactor`

Resets the scale factor to the initial value specified by `g.neovide_initial_scale_factor`.

## Keybindings

- `<C-=>` - Increase the Neovide scale factor by the amount specified by `g.neovide_change_scale_factor`.
- `<C-->` - Decrease the Neovide scale factor by the amount specified by `g.neovide_change_scale_factor`.
- `<C-0>` - Reset the Neovide scale factor to the initial value specified by `g.neovide_initial_scale_factor`.
