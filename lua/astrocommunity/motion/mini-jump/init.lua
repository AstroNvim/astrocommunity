return {
  "echasnovski/mini.jump",
  event = "User AstroFile",
  opts = {
    delay = {
      -- Delay between jump and highlighting all possible jumps
      highlight = 250,

      -- Delay between jump and automatic stop if idle (no jump is done)
      idle_stop = 1000,
    },
  },
}
