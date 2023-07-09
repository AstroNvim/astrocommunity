# nvim-dap-virtual-text

This plugin adds virtual text support to `nvim-dap`. `nvim-treesitter` is used to find variable definitions.

**Repository:** <https://github.com/theHamsta/nvim-dap-virtual-text>

The `hlgroup` for the virtual text is `NvimDapVirtualText` (linked to Comment). Exceptions that caused the debugger to stop are displayed as `NvimDapVirtualTextError` (linked to `DiagnosticVirtualTextError`). Changed and new variables will be highlighted with `NvimDapVirtualTextChanged` (default linked to `DiagnosticVirtualTextWarn`).
