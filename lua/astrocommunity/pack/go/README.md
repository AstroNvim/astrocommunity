# Go Language Pack

**Requirements:** `go` must be in your `PATH` and executable

This plugin pack does the following:

- Adds `go` Treesitter parsers
- Adds `gopls` language server
  - By default it is configured to use [`gofumpt`](https://github.com/mvdan/gofumpt) for formatting
- Adds the following go packages:
  - [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports?utm_source=godoc)
  - [gomodifytags](https://github.com/fatih/gomodifytags)
  - [gotests](https://github.com/cweill/gotests)
  - [iferr](https://github.com/koron/iferr)
  - [impl](https://github.com/josharian/impl)
- Adds [nvim-dap-go](https://github.com/leoluz/nvim-dap-go) for debugging
- Adds [gopher.nvim](https://github.com/olexsmir/gopher.nvim) for language specific tools
- Adds [neotest-golang](https://github.com/fredrikaverpil/neotest-golang) as a neotest adapter.
