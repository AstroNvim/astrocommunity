# Harper LS

[Harper](https://writewithharper.com) is an English grammar checker designed to be _just right_.

**Repository:** <https://github.com/elijah-potter/harper/blob/master/harper-ls>

## How do I set my own LSP configuration?

To add your configuration, you have to extend `AstroNvim/astrolsp` opts.

> See the options that `harper-ls` support [here](https://writewithharper.com/docs/integrations/language-server#Configuration).

```lua
---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              --- Your configuration
            },
          },
        },
      },
    },
  },
}
```
