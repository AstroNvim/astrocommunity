https://github.com/kaiuri/onigiri.nvim/tree/master

print(require 'onigiri'.presets)
--- > mariana
--- > gruvbox
--- > kaolin
--- > solarized
--- > moonlight

vim.g.onigiri = {
theme = require 'onigiri'.presets.mariana
}
