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
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { treesitter_context = true } },
    },
  },
}
