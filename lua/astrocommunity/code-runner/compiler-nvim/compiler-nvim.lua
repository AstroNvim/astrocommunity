return {
  {
    "Zeioth/compiler.nvim",
    dependencies = { "stevearc/overseer.nvim" },
    cmd = {"CompilerOpen", "CompilerToggleResults"},
    config = function(_, opts) require("compiler").setup(opts) end,
  },
  {
    "stevearc/overseer.nvim",
    cmd = {"CompilerOpen", "CompilerToggleResults"},
    opts = {
      task_list = { -- this refers to the window that shows the result
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = {
          ["q"] = function() vim.cmd("OverseerClose") end ,
        }
      },
    },
    config = function(_, opts) require("overseer").setup(opts) end,
  },
}
