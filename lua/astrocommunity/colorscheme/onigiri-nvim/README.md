# onigiri.nvim

**Repsitory:** https://github.com/kaiuri/onigiri.nvim

removes the boilerplate needed to create the colorscheme you always wanted

```
print(require 'onigiri'.presets)
--- > mariana
--- > gruvbox
--- > kaolin
--- > solarized
--- > moonlight
vim.g.onigiri = {
theme = require 'onigiri'.presets.mariana
}
```
