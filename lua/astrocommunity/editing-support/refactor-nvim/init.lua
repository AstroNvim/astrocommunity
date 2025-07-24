return {
  "ShifatHasanGNS/refactor.nvim",
  config = function()
    require("refactor").setup({
      default_flags = "", -- Case-insensitive, Partial-match, Literal-text, Normal-case
    })
  end,
}
