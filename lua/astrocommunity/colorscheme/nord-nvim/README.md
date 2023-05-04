# nord.nvim

**Repository:** <https://github.com/shaunsingh/nord.nvim>

Neovim theme based off of the Nord Color Palette, written in lua with treesitter support

## Customization

To support [headlines](https://github.com/lukas-reineke/headlines.nvim), you should add this code to your config:

```lua
local utils = require("astronvim.utils")
{
  "lukas-reineke/headlines.nvim",
  opts = function(_, opts)
    if not opts.markdown then opts.markdown = {} end
    opts.markdown.headline_highlights = utils.list_insert_unique(opts.markdown.headline_highlights, {
      "Headline1",
      "Headline2",
      "Headline3",
      "Headline4",
      "Headline5",
      "Headline6",
    })
    opts.markdown.codeblock_highlight = utils.list_insert_unique(opts.markdown.codeblock_highlight, "CodeBlock")
    opts.markdown.dash_highlight = utils.list_insert_unique(opts.markdown.dash_highlight, "Dash")
    opts.markdown.quote_highlight = utils.list_insert_unique(opts.markdown.quote_highlight, "Quote")
  end,
},

```

To support [BufferLine](https://github.com/akinsho/nvim-bufferline.lua), you can add this code to your config:

```lua
local utils = require("astronvim.utils")
{
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    if not opts.options then opts.options = {} end
    opts.options = utils.list_insert_unique(opts.options, {
      separator_style = "thin",
    })
  
    local highlights = require("nord").bufferline.highlights({
      italic = true,
      bold = true,
    })
  
    opts.highlights = utils.list_insert_unique(opts.highlights, highlights)
  end,
}
```
