local utils = require "astrocore"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    dependencies = {
      {
        "szebniok/tree-sitter-wgsl",
        build = "cp -r queries ../nvim-treesitter/queries/wgsl",
        init = function() vim.filetype.add { extension = { wgsl = "wgsl" } } end,
        config = function()
          require("nvim-treesitter.parsers").get_parser_configs().wgsl = {
            install_info = {
              url = vim.fn.stdpath "data" .. "/lazy/tree-sitter-wgsl",
              files = { "src/parser.c", "src/scanner.c" },
            },
            filetype = "wgsl",
          }
        end,
      },
    },
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "wgsl") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "wgsl_analyzer") end,
  },
}
