---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "User AstroFile",
  cmd = { "TSContextToggle" },
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>uT"] = {
            "<cmd>TSContextToggle<CR>",
            desc = "Toggle treesitter context",
          },
        },
      },
    },
  },
}
