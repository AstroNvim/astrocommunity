---@type LazySpec
return {
  "echasnovski/mini.diff",
  event = "User AstroGitFile",
  opts = function()
    local sign = require("astroui").get_icon "GitSign"
    return {
      view = {
        style = "sign",
        signs = { add = sign, change = sign, delete = sign },
      },
      mappings = {
        apply = "gh",
        goto_first = "[G",
        goto_last = "]G",
        goto_next = "]g",
        goto_prev = "[g",
        reset = "gH",
        textobject = "g",
      },
    }
  end,
  specs = {
    { "lewis6991/gitsigns.nvim", enabled = false },
  },
}
