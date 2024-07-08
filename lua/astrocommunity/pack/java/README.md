# Java Language Pack

Requires:

- `JDK-17` or higher to function.

This plugin pack does the following:

- Adds `java` treesitter parsers
- Adds `jdtls` language server
- Adds [nvim-java](https://github.com/nvim-java/nvim-java) for language specific tooling

## Tips

`jdtls` requires Java 11+ but can be used to develop on any Java version. If you develop using different Java runtimes, you can set the runtimes you have available in the settings of `jdtls`.
Here is a simple example:

```lua
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.java" },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        jdtls = {
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
    },
  },
}
```
