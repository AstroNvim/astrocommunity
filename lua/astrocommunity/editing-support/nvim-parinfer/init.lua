return {
  "gpanders/nvim-parinfer",
  ft = { "clojure", "scheme", "lisp", "racket", "hy", "fennel", "janet", "carp", "wast", "yuck", "dune" },
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      options = { g = {
        parinfer_force_balance = true,
      } },
    },
  },
}
