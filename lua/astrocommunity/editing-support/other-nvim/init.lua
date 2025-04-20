return {
  "rgroli/other.nvim",
  ft = {
    -- built-in mapping support
    "livewire",
    "angular",
    "laravel",
    "rails",
    "golang",
    "python",
    "react",
    "rust",
    "elixir",
    -- custom (defined in opts > mappings)
    "clojure",
  },
  main = "other-nvim",
  opts = {
    mappings = {
      { -- clojure unit test files
        pattern = function(path)
          local match = vim.fn.matchlist(path, "\\v^(.*)/src/(.{-}_test)@!(.{-}).clj(.?)")
          if #match > 0 then return match end
        end,
        target = "%2/test/%4_test.clj%5",
        context = "test",
      },
      { -- clojure source code
        pattern = "(.*)/test/(.*)_test.clj(.?)$",
        target = "%1/src/%2.clj%3",
        context = "implementation",
      },
    },
  },
}
