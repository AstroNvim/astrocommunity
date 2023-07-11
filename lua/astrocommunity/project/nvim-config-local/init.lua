local util = require "astronvim.utils"

return {
  "klen/nvim-config-local",
  opts = {},
  cond = util.root_has_file ".nvim.lua" or util.root_has_file ".nvimrc" or util.root_has_file ".exrc",
  lazy = false,
}
