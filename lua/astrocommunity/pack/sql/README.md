# SQL Language Pack

This plugin pack does the following:

- Adds `sql` Treesitter parser
- Adds `sqls` language server
    - `go` must be in your `PATH` and executable.
    - formatting is disabled due to https://github.com/sqls-server/sqls/issues/149
- Adds [sqls.nvim](https://github.com/nanotee/sqls.nvim) for language specific tooling
- Adds `sqlfluff` for both formatting and linting
    - You must create a `.sqlfluff` file in the same folder as your sql files
    - The `.sqlfluff` file must define the sql dialect to be used
    - Example, more details can be found [here](https://docs.sqlfluff.com/en/stable/configuration/index.html):
    ```ini
    [sqlfluff]
    dialect = postgres
    ```
