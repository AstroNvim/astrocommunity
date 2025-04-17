# golangci-lint

Fast linters runner for Go.

This plugin pack integrates [golangci-lint](https://golangci-lint.run/) into your AstroNvim setup using the [golangci-lint-langserver](https://github.com/nametake/golangci-lint-langserver).

**Features:**

- Supports a wide range of linters to catch common errors and improve code quality.
- Automatically installs `golangci-lint-langserver` via Mason.
- Provides lint diagnostics directly in your editor using `golangci-lint`.
- Runs `golangci-lint` efficiently in the background.

**Note:** This pack imports the Go language pack (`astrocommunity.pack.go`) for a complete Go development environment.
