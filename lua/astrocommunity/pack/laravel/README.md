# Laravel Pack

**Note:** Installation of `phpactor` requires `composer`

**Note:** `laravel-dev-generators` in your path. See the releases section of https://github.com/haringsrob/laravel-dev-tools

**Note:** For proper blade template highlighting, you'll need to manually add the queries file https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussion-5400675

This plugin pack does the following:

- Adds [php pack](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/php)
  - Adds php and phpdoc Treesitter parsers
  - Adds phpactor language servers
  - Adds php-cs-fixer for formatting
  - Adds php-debug-adapter for debugging
- Adds [blade pack](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/blade)
  - Adds blade Treesitter parser: https://github.com/EmranMR/tree-sitter-blade
  - Adds blade language server: https://github.com/haringsrob/laravel-dev-tools
  - Adds blade-formatter to null-ls or conform
- Adds `laravel.nvim` for laravel specific tools
- Adds `laravel-ide-helper.nvim` for laravel model info
- Adds `blade-nav.nvim` for cmp and gf for views/routes/configs and more
