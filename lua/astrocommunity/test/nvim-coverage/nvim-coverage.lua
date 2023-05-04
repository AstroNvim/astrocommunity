return {
  "andythigpen/nvim-coverage",
  event = "User AstroFile",
  requires = { "nvim-lua/plenary.nvim" },
  -- Optional: needed for PHP when using the cobertura parser
  rocks = { "lua-xmlreader" },
}
