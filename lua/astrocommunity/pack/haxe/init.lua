return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.haxe = {
        install_info = {
          url = "https://github.com/vantreeseba/tree-sitter-haxe",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "haxe",
      }

      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "haxe" })
      end
    end,
  },
}
