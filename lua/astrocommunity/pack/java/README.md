# Java Language Pack

Requires:

- `JDK-17` or higher to function.

This plugin pack does the following:

- Adds `java` treesitter parsers
- Adds `html` treesitter parsers (XML)
- Adds `jdtls` language server
- Adds `lemminx` language server (XML)
- Adds [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) for language specific tooling
  - Enables [hot reloading](https://github.com/mfussenegger/nvim-jdtls/issues/80)
- Adds `clang_format` through null-ls
- Adds `javadbg` and `javatest` debug adapters for nvim-dap

## Tips

`jdtls` requires Java 11+ but can be used to develop on any Java version. If you develop  using different Java runtimes, you can set the runtimes  you have available in the settings of `jdtls`. Here is a simple example:

```lua
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.java" },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-11",
                path = "/usr/lib/jvm/java-11-openjdk/",
              },
            },
          },
        },
      },
    },
  },
```
