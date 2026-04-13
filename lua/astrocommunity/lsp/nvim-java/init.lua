return {
  "nvim-java/nvim-java",
  lazy = true,
  opts = {},
  specs = {
    { "mfussenegger/nvim-jdtls", optional = true, enabled = false },
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@type AstroLSPOpts
      opts = {
        servers = { "jdtls" },
        handlers = {
          jdtls = function(server)
            require("lazy").load { plugins = { "nvim-java" } }
            vim.lsp.enable(server)
          end,
        },
      },
    },
  },
}
