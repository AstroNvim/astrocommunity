# onigiri.nvim

removes the boilerplate needed to create the colorscheme you always wanted

**Repsitory:** <https://github.com/kaiuri/onigiri.nvim>

_Note_: This repository has been archived by the owner on May 3, 2023. It is now read-only.

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
