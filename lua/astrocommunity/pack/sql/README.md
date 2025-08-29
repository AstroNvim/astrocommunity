# SQL Language Pack

This plugin pack does the following:

- Adds `sql` Treesitter parser
- Adds `sqls` language server
    - `go` must be in your `PATH` and executable.
    - formatting is disabled due to https://github.com/sqls-server/sqls/issues/149
- Adds [sqls.nvim](https://github.com/nanotee/sqls.nvim) for language specific tooling
- Adds [sqlfluff](https://docs.sqlfluff.com) for both formatting and linting
