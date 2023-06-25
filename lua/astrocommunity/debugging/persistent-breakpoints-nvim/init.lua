return {
  "Weissle/persistent-breakpoints.nvim",
  event = "BufReadPost",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      load_breakpoints_event = { "BufReadPost" },
    })
  end,
  keys = {
    {
      "<leader>db",
      function() require("persistent-breakpoints.api").toggle_breakpoint() end,
      { silent = true },
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dB",
      function() require("persistent-breakpoints.api").clear_all_breakpoints() end,
      { silent = true },
      desc = "Clear Breakpoints",
    },
    {
      "<leader>dC",
      function() require("persistent-breakpoints.api").set_conditional_breakpoint() end,
      { silent = true },
      desc = "Conditional Breakpoint",
    },
  },
}
