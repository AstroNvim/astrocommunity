local utils = require "astrocore"
return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  dependencies = {
    {
      "vantreeseba/tree-sitter-haxe",
      build = "cp -r queries ../nvim-treesitter/queries/haxe",
      init = function() vim.filetype.add { extension = { hx = "haxe" } } end,
      config = function()
        require("nvim-treesitter.parsers").get_parser_configs().haxe = {
          install_info = { url = vim.fn.stdpath "data" .. "/lazy/tree-sitter-haxe", files = { "src/parser.c" } },
          filetype = "haxe",
        }
      end,
    },
  },
  opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "haxe") end,
}
