return {
  { "bennypowers/nvim-regexplainer", opts = {}, ft = { "html", "javascript", "typescript" } },
  -- Regex support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the "regex" parser to opts.ensure_installed.
      table.insert(opts.ensure_installed, "regex")
    end,
  },
}
