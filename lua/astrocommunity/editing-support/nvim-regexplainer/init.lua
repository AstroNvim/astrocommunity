return {
  "bennypowers/nvim-regexplainer",
  opts = {},
  ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  specs = {
    {
      "AstroNvim/astrocore",
      optional = true,
      ---@type AstroCoreOpts
      opts = {
        treesitter = { ensure_installed = { "regex" } },
      },
    },
  },
}
