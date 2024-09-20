# Rust Language Pack

This plugin pack does the following:

- Adds `rust` Treesitter parsers
- Adds [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) for language specific tooling (v4 or v5 depending on nvim version)
- Adds [crates.nvim](https://github.com/Saecki/crates.nvim) for crate management
- Adds [TOML language support](../toml)

> [!NOTE]
> This pack DOES not add `rust_analyzer`. This should be managed by rustup. To add it to rustup, run: `rustup component add rust-analyzer`

## Additional LSP Configuration Tweaks

Configuring the LSP is out of scope for community packs, but here are some interesting things you
may want to do:

## Make Rust-Analyzer use its own profile

Add this into your LSP configuration to make the rust-analyzer use its own profile. The effect is
that you will use more disk space as rust-analyzer gets its own special folder in `targets`. The
upside is that you can run `cargo build` without that being blocked while rust-analyzer runs.

The following can be added to the configuration of AstroLSP to customize the profiles used by rust-analyzer.

```lua
return {
  "AstroNvim/astrolsp",
  opts = {
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
            },
          },
        },
      },
    },
  },
}
```

## Use `cargo check` for `rust-analyzer.check.command`

By default, this pack configures `rust-analyzer.check.command` to use `cargo clippy` instead of `cargo check`.

In some cases (for example, on large projects where `cargo clippy` is slow), you may want to use `cargo check` instead.

### Global default

You can configure the settings with AstroLSP similar to the instructions shown above:

```lua
return {
  "AstroNvim/astrolsp",
  opts = {
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            check = { command = "check", extraArgs = {} },
          },
        },
      },
    },
  },
}
```

### Per Project

Currently, `rust-analyzer` itself cannot be configured per project, [adding `rust-analyzer.toml` support is still in progress](https://github.com/rust-lang/rust-analyzer/issues/13529).
However, `rustaceanvim` [supports loading `rust-analyzer.json` files from the root of your project.](https://github.com/mrcjkb/rustaceanvim#how-to-dynamically-load-different-rust-analyzer-settings-per-project)
If you want to use `cargo check` as your default `rust-analyzer.check.command`, you can create a `rust-analyzer.json` file in the root of your project with the following contents:
For more information on the `rust-analyzer` configuration, see the [rust-analyzer documentation](https://rust-analyzer.github.io/manual.html#configuration).

```json
{
  "rust-analyzer": {
    "check": {
      "command": "check"
    }
  }
}
```
