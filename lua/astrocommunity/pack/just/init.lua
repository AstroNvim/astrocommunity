vim.filetype.add {
  extension = { just = "just" },
  filename = {
    justfile = "just",
    Justfile = "just",
    [".Justfile"] = "just",
    [".justfile"] = "just",
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  opts = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.just = {
      install_info = {
        url = "https://github.com/IndianBoy42/tree-sitter-just",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
      },
      filetype = "just",
      maintainers = { "@IndianBoy42" },
    }

    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, "just")
  end,
}
