vim.notify(
  "**DEPRECATED** astrocommunity.debugging.nvim-bqf\n\nPlease use new location:\n`astrocommunity.quickfix.nvim-bqf`",
  vim.log.levels.ERROR
)
return { import = "astrocommunity.quickfix.nvim-bqf" }
