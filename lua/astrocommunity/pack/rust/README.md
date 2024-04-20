# Rust Language Pack
This plugin pack does the following:

- Adds `rust` Treesitter parsers
- Adds [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) for language specific tooling
- Adds [crates.nvim](https://github.com/Saecki/crates.nvim) for crate management
- Adds [TOML language support](../toml)

> [!NOTE]
> This pack DOES not add `rust_analyzer`. This should be managed by rustup. To add it to rustup, run:  `rustup component add rust-analyzer`

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
