# Hydra.nvim

Create custom submodes and menus

**Repository:** <https://github.com/nvimtools/hydra.nvim>

This implements configuration of Hydra.nvim through the `opts` table to make it easier for the user to configure various Hydra heads as well as allow AstroCommunity entries to also provide Hydra heads if it makes sense. Here is an example of defining a Hydra using the `opts` table:

```lua
return {
  "nvimtools/hydra.nvim",
  opts = {
    -- the first key is the name if name isn't set in the table
    ["Side scroll"] = {
      mode = "n",
      body = "z",
      heads = {
        { "h", "5zh", { desc = "←" } },
        { "l", "5zl", { desc = "→" } },
        { "H", "zH", { desc = "half screen ←" } },
        { "L", "zL", { desc = "half screen →" } },
      },
    },
  },
}
```

For advanced users, this also makes the resulting Hydra objects available through the use of the AstroCore utility: `plugin_opts`. Here is an example of retrieving the Hydra object during runtime:

```lua
require("lazy").load { plugins = { "hydra.nvim" } } -- load Hydra before loading opts
local hydra_opts = require("astrocore").plugin_opts "hydra.nvim" -- get the plugin options
local side_scroll_hydra = hydra_opts["Side scroll"].hydra -- get the created hydra by key name
side_scroll_hydra:activate() -- use the object like normal
```
