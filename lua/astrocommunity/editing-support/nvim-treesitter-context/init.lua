---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "User AstroFile",
  cmd = { "TSContext" },
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>uT"] = {
            "<cmd>TSContext toggle<CR>",
            desc = "Toggle treesitter context",
          },
        },
      },
    },
  },
}
