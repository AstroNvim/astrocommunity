return {
  "LiadOz/nvim-dap-repl-highlights",
  dependencies = { "mfussenegger/nvim-dap" },
  event = "User AstroFile",
  config = function()
    require("nvim-dap-repl-highlights").setup()
    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
      },
      ensure_installed = { "dap_repl" },
    }
  end,
}
