return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  dependencies = {
    {
      "IndianBoy42/tree-sitter-just",
      config = function()
        require("nvim-treesitter.parsers").get_parser_configs().just = {
          install_info = { url = vim.fn.stdpath "data" .. "/lazy/tree-sitter-just", files = { "src/parser.c" } },
          files = { "src/parser.c", "src/scanner.cc" },
          branch = "main",
          -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
        }
      end,
    },
  },
}
