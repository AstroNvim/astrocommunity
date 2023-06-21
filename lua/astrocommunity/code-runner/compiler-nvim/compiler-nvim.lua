return {
  {
    "https://github.com/Zeioth/compiler.nvim",
    cmd = {"CompilerOpen", "CompilerToggleResults"},
    config = function(_, opts) require("compiler").setup(opts) end,
  },
  {
    "stevearc/overseer.nvim",
    cmd = {"CompilerOpen", "CompilerToggleResults"},
    opts = {
      -- Tasks are disposed 5 minutes after running to free resources.
      -- If you need to close a task inmediatelly:
      -- press ENTER in the outut menu on the task you wanna close.
      task_list = { -- this refers to the window that shows the result
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = {
          ["q"] = function() vim.cmd("OverseerClose") end ,
        }
      },
      -- component_aliases = { -- uncomment this to disable notifications
      --   -- Components included in default will apply to all tasks
      --   default = {
      --     { "display_duration", detail_level = 2 },
      --     "on_output_summarize",
      --     "on_exit_set_status",
      --     "on_complete_notify",
      --     "on_complete_dispose",
      --   },
      -- },
    },
    config = function(_, opts) require("overseer").setup(opts) end,
  },
}
