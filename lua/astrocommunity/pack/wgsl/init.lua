local utils = require "astronvim.utils"
return {
  {
    "szebniok/tree-sitter-wgsl",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = "cp -r queries ../nvim-treesitter/queries/wgsl",
    config = function()
      vim.filetype.add { extension = { wgsl = "wgsl" } }
      require("nvim-treesitter.parsers").get_parser_configs().wgsl = {
        install_info = {
          url = vim.fn.stdpath "data" .. "/lazy/tree-sitter-wgsl",
          files = { "src/parser.c", "src/scanner.c" },
        },
      }
    end,
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "wgsl") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "wgsl_analyzer") end,
  },
}
