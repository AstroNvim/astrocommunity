local utils = require "astronvim.utils"
return {
  {
    "vantreeseba/tree-sitter-haxe",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = "cp -r queries ../nvim-treesitter/queries/haxe",
    config = function()
      vim.filetype.add { extension = { hx = "haxe" } }
      require("nvim-treesitter.parsers").get_parser_configs().haxe =
        { install_info = { url = vim.fn.stdpath "data" .. "/lazy/tree-sitter-haxe", files = { "src/parser.c" } } }
      vim.cmd.TSInstall "haxe"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "haxe_language_server")
    end,
  },
}
