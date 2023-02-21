<div align="center" id="madewithlua">
    <img src="https://astronvim.com/img/logo/astronvim.svg" width="110", height="100">
</div>

<h1 align="center">AstroNvim Community Repository</h1>

<p align="center">
    <a href="https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/colorscheme?label=Colorschemes&style=for-the-badge&logo=neovim&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/completion">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/completion?label=Completion Plugins&style=for-the-badge&logo=neovim&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
</p>

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
