# Github Nvim theme

Github's Neovim themes

**Repository:** <https://github.com/projekt0n/github-nvim-theme>

## Usage

In your `plugins/astroui.lua` file, put:

```lua
return {
    "AstroNvim/astroui",
    opts = {
        colorscheme = "github_dark",
        -- colorscheme = "github_dark_default",
        -- colorscheme = "github_dark_dimmed",
        -- colorscheme = "github_dark_colorblind",
        -- colorscheme = "github_dark_high_contrast",
        -- colorscheme = "github_dark_tritanopia",

        -- colorscheme = "github_light",
        -- colorscheme = "github_light_default",
        -- colorscheme = "github_light_colorblind",
        -- colorscheme = "github_light_high_contrast",
        -- colorscheme = "github_light_tritanopia",
    }
}
```

Or whichever colorscheme you'd want.
