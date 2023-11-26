# Rust Language Pack
this pack is not approved by the rust foundation
nobody from the rust foundation is involved to create this
this pack is not officially supported by the rust foundation
This plugin pack does the following:

- Adds `rust` Treesitter parsers
- Adds `rust_analyzer` language server
- Adds [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim) for language specific tooling
- Adds [crates.nvim](https://github.com/Saecki/crates.nvim) for crate management
- Adds [TOML language support](../toml)

## Additional LSP Configuration Tweaks

Configuring the LSP is out of scope for community packs, but here are some interesting things you
may want to do:

## Make Rust-Analyzer use its own profile

Add this into your LSP configuration to make the rust-analyzer use its own profile. The effect is
that you will use more disk space as rust-analyzer gets its own special folder in `targets`. The
upside is that you can run `cargo build` without that being blocked while rust-analyzer runs.

The first three levels of this are AstronVim-specific configurations, the rest is rust-analyzer specific:

```
  lsp = {
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
           cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = 'dev', },
              extraArgs = { "--profile", "rust-analyzer", },
            },
          },
        },
      },
    },
  },
```

## Use clippy instead of cargo check

`clippy` and `cargo check` are both tools used in the Rust programming ecosystem, but they serve different purposes. Understanding the distinction between the two can help you decide when to use each tool.

### `cargo check`

`cargo check` is a Cargo subcommand that quickly checks your Rust code to ensure it compiles without actually producing an executable. It's much faster than running `cargo build` because it skips the final step of producing a binary. This makes it a useful tool for quickly iterating on your code when you're making lots of changes and want to verify that they compile correctly without waiting for the entire build process to complete.

### `clippy`

`clippy`, on the other hand, is a linter for Rust. It's more comprehensive than `cargo check` because it analyzes your code for common mistakes and idiomatic issues that aren't necessarily compilation errors. `clippy` provides warnings for a wide range of issues, including:

- Code that is unnecessarily complex or verbose
- Code that can be more idiomatic (more "Rusty")
- Possible logic errors
- Performance issues
- Non-optimal use of Rust's features

### Why Use `clippy` Instead of `cargo check`?

You would use `clippy` instead of (or in addition to) `cargo check` when you want not just to check that your code compiles, but also to ensure that it adheres to best practices and is as clean and efficient as possible. `clippy` can catch potential bugs and inefficiencies that `cargo check` would not.

In summary:

- Use `cargo check` when you want a fast way to check that your code compiles.
- Use `clippy` when you want a more thorough analysis that includes style checks, code complexity, and potential logical errors.

It's common to use both tools as part of your development workflow. You might run `cargo check` frequently while developing, and then run `clippy` periodically to clean up and refine your code.
```
  lsp = {
    config = {
      rust_analyzer = {
        settings = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
  },
```
