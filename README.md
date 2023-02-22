<div align="center" id="madewithlua">
    <img src="https://astronvim.com/img/logo/astronvim.svg" width="110", height="100">
</div>

<h1 align="center">AstroNvim Community Repository</h1>

<p align="center">
    <a href="lua/astrocommunity/color">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/color?label=Color Plugins&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=f4dbd6"/>
    </a>
    <a href="lua/astrocommunity/colorscheme">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/colorscheme?label=Colorschemes&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=f0c6c6"/>
    </a>
    <a href="lua/astrocommunity/completion">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/completion?label=Completion Plugins&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=f5bde6"/>
    </a>
    <a href="lua/astrocommunity/diagnostics">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/diagnostics?label=Diagnostics Plugins&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=c6a0f6"/>
    </a>
    <a href="lua/astrocommunity/media">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/media?label=Media Plugins&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=ee99a0"/>
    </a>
    <a href="lua/astrocommunity/motion">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/motion?label=Motion Plugins&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=f5a97f"/>
    </a>
    <a href="lua/astrocommunity/scrolling">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/scrolling?label=Scrolling Plugins&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=eed49f"/>
    </a>
    <a href="lua/astrocommunity/pack">
      <img src="https://img.shields.io/github/directory-file-count/AstroNvim/astrocommunity/lua/astrocommunity/pack?label=Plugin Packs&style=for-the-badge&logo=neovim&logoColor=D9E0EE&labelColor=302D41&color=b7bdf8"/>
    </a>
</p>

<!--
Category Colors:
#f4dbd6: color
#f0c6c6: colorscheme
#f5bde6: completion
#c6a0f6: diagnostics
#ee99a0: media
#f5a97f: motion
#eed49f: scrolling
#a6da95:
#8bd5ca:
#91d7e3:
#7dc4e4:
#8aadf4:
#b7bdf8: pack
-->

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
