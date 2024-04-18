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
- Adds `javadbg` and `javatest` debug adapters for nvim-dap

## Note

We require that the root folder of your projects include one of these files/folders([Reference](https://github.com/AstroNvim/astrocommunity/blob/49e9a3961bba079d7f413b8d5567382dd6f55392/lua/astrocommunity/pack/java/java.lua#LL37C96-L37C96)):  
`.git`, `mvnw`, `gradlew`, `pom.xml`, `build.gradle` or `.project`

## Tips

`jdtls` requires Java 11+ but can be used to develop on any Java version. If you develop using different Java runtimes, you can set the runtimes you have available in the settings of `jdtls`.
Here is a simple example:

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
        format = {
          enabled = true,
          settings = { -- you can use your preferred format style
            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
      },
    },
  }
```
