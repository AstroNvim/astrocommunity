return {
  "LiadOz/nvim-dap-repl-highlights",
  lazy = true,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "LiadOz/nvim-dap-repl-highlights", opts = {} },
    },
    {
      "AstroNvim/astrocore",
      optional = true,
      ---@type AstroCoreOpts
      opts = {
        treesitter = { ensure_installed = { "dap_repl" } },
      },
    },
  },
}
