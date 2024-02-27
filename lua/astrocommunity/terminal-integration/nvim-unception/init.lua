return {
  "samjwill/nvim-unception",
  lazy = false,
  priority = 1001,
  dependencies = {
    "AstroNvim/astrocore",
    opts = { options = { g = {
      unception_block_while_host_edits = true,
    } } },
  },
}
