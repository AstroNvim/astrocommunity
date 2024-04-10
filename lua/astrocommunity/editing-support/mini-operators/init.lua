-- NOTE: the default prefix is `g`, but this will override some bindings.
local prefix = "g"

---@type LazySpec
return {
  "echasnovski/mini.operators",
  event = "User AstroFile",
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          [prefix] = {
            name = "Text edit operators",
          },
        },
        v = {
          [prefix] = {
            name = "Text edit operators",
          },
        },
      },
    },
  },
  opts = {
    evaluate = { prefix = prefix .. "e" },
    exchange = { prefix = prefix .. "x" },
    multiply = { prefix = prefix .. "m" },
    replace = { prefix = prefix .. "r" },
    sort = { prefix = prefix .. "s" },
  },
}
