# AstroNvim Community Repository

This is a community repository easily adding common plugins to AstroNvim.

## 📦 Setup

Add the following to your `plugins` configuration, either in your `user/init.lua` file or in a file in `user/plugins/` folder such as `user/plugins/community.lua`

### `user/init.lua` example

Put the following in your `user/init.lua` file:

```lua
return {
  plugins = {
    {
      "AstroNvim/astrocommunity",
      { import = "astrocommunity.colorscheme.catppuccin" }
      -- ... import any community contributed plugins here
    }
  }
}
```

### `user/plugins/community.lua` example

Put the following in the file `user/plugins/community.lua`

```lua
return {
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.catppuccin" }
    -- ... import any community contributed plugins here
  }
}
```
