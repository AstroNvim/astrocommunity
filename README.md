<div align="center" id="madewithlua">
  <img
    src="https://astronvim.com/logo/astronvim.svg"
    width="110"
    ,
    height="100"
  />
</div>
<h1 align="center">AstroNvim Community Repository</h1>

AstroNvim's community repository contains plugin configuration specifications — a collection of plugins contributed by the community for AstroNvim, a NeoVim configuration. These specifications help manage the variety of plugins used in AstroNvim.

## 📦 Setup

To integrate the community plugins, add the provided configurations to your `plugins` setup preferably before you import your own plugins to guarantee all AstroCommunity changes are loaded before your own overrides. If you are using the [AstroNvim Template](https://github.com/AstroNvim/template) This can be done in your `lua/community.lua` file. If you're unfamiliar with configuring plugins, we recommend referring to the [AstroNvim documentation](https://docs.astronvim.com/configuration/customizing_plugins/).

### Importing AstroCommunity Plugins

Integrate the following content within your `lua/community.lua` file:

```lua
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- ... import any community contributed plugins here
}
```

### Customizing AstroCommunity Installations

Once you have AstroCommunity imports defined in your `lua/community.lua` you can then further customize the installations in your own plugin definitions (typically done in the `lua/plugins/` directory). Here is an example assuming you have Catppuccin installed as shown above.

```lua
return {
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
      },
    },
  },
}
```

**Notes:**

- To disable imports, set the `enabled` option to `false`. You have two approaches to modify an existing plugin: use the full repository name (e.g., "m4xshen/smartcolumn.nvim") or the module name (e.g., "catppuccin"). Remember, the module name might differ from the folder name.
- It's recommended to use the full import path when customizing a plugin, and not the shorthand notation of just the repository name.
- You can override many aspects of community plugins including settings, dependencies, and versions. For more details on available options, refer to the [lazy.nvim documentation](https://lazy.folke.io/).

## Contributing

If you've written a plugin configuration and wish to add it with the AstroCommunity repository, please follow our [Contribution Guidelines](./CONTRIBUTING.md) and submit a pull request. Ensure you've rigorously tested your changes before submission. This isn't an official repository, so its stability relies on community contributions. We're excited to see how this project grows and evolves!
