# Community Picker

A Telescope-style (but using `nui.nvim`) picker to browse, install, and uninstall AstroCommunity plugins.

## Usage

Press `<Leader>pc` to open the picker.

### Navigation

*   **Search Input**: Filter plugins.
    *   `<Down>`, `<C-j>`, `<Tab>`: Move to Categories list.
*   **Categories (Left)**: Browse sections.
    *   `j`/`k`: Navigate.
    *   `l`, `<Right>`: Expand/Move to Plugins list.
    *   `/`, `i`: Return to Search.
*   **Plugins (Right)**: Select plugins.
    *   `j`/`k`: Navigate.
    *   `h`, `<Left>`: Return to Categories.
    *   `<Space>`, `<Enter>`, `a`: Toggle install status.
    *   `x`: Mark for removal.

### Features

*   **Visual Feedback**: Installed plugins show as green, removed ones as red.
*   **Categorized View**: Browse by standard AstroCommunity categories.
*   **Search**: Filters both categories and plugin names.
